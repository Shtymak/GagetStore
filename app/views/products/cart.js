var cart_body = document.getElementById('cart_body')
cart_body.innerHTML = '<%= j render  Cart::ProductComponent.with_collection(@products)%>'
