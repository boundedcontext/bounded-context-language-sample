
create environment 'develop-0.0.1';

create domain 'e-commerce' using environment 'develop-0.0.1';
create context 'shopping' for domain 'e-commerce' using environment 'develop-0.0.1';

using environment 'develop-0.0.1';
for domain 'e-commerce';
in context 'shopping';

create aggregate 'carts' (shopper_id, products, is_created, is_checked_out)
	as (identifier, identifier, index, boolean, boolean) 
	defaults (null, empty, false, false)
;

create event 'empty';
create event 'full';

create event 'created' (shopper_id) as (identifier);

add handler for event 'created' as ({
	from agregate
		set is_created = true;
});

create event 'checked-out';

add handler for event 'checked-out' as ({
	from aggregate
		set is_checked_out = true;
});

create event 'product-added' (product) as (entity\product);

add handler for event 'product-added' as ({
	from aggregate
		add to index 'products' (product.id);
});

create event 'product-quantity-changed' (product_id, quantity) as (identifier, value\quantity);

create event 'product-removed' (product_id) as (identifier);

add handler for event 'product-removed' as ({
	from aggregate
		remove from index 'products' (product.id);
});

create invariant 'created' satisfied when ({
	from aggregate where is_created = true;
});

create invariant 'checked-out' satisfied when ({
	from aggregate where is_checked_out = true;
});

create invariant 'empty' satisfied when ({
	from aggregate
	count items
	equals 0;
});

create invariant 'full' satisfied when ({
	from aggregate
	count items
	equals 10;
});

create invariant 'product-exists' (product_id) as (identifier) satisfied when ({
	from aggregate
	exists product_id in items;
});

create invariant 'has-one-cart' (shopper_id) as (identifier) satisfied when ({
	from all
	count
	where shopper_id = shopper_id
		and is_created = true
		and is_checked_out = true
	greater_than 0;
});

create command 'create' (shopper_id) as (identifier);

add handler for command 'create' as ({

    assert not 'created';
    assert 'has-one-cart';

    apply event 'created' (shopper_id) as (command.shopper_id);
    apply event 'empty';
});

create command 'add-product' (product) as (entity\product);

add handler for command 'add-product' as ({

    assert not 'checked-out';
    assert not 'full';
    assert not 'product-exists' (product_id) as (command.product.id);

    apply event 'product-added' (product) as (command.product);

    check 'full' then ({
    	apply event 'full';
    });
});

create command 'change-product-quantity' (product_id, quantity) as (identifier, value\quantity);

add handler for command 'change-product-quantity' as ({

    assert not 'checked-out';
    assert 'product-exists' (product_id) as (command.product.id);

    apply event 'product-quantity-changed' (product_id, quantity) as (command.product_id, command.quantity);
});

create command 'remove-product' (product_id) as (identifier);

add handler for command 'remove-product' as ({

    assert not 'checked-out';
    assert 'product-exists' (product_id) as (command.product.id);

    apply event 'product-removed' (product_id) as (command.product_id);
});

create command 'checkout';

add handler for command 'checkout' as ({

    assert not 'checked-out';

    apply event 'checked-out';

    check 'empty' then ({
    	apply event 'empty';
    });
});




