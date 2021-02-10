
import Rails from "@rails/ujs"
import * as bootstrap from 'bootstrap'

  export function add_to_cart(product_id) {
    Rails.ajax({
      type: "POST",
      url: "/products/" + product_id + "/add_to_cart",
      success: function(response) {
        console.log("succses response")
      },
      error: function(response) {
        console.log("error")
      }
    })
  }

  export function show_cart() {
    Rails.ajax({
      type: "GET",
      url: "/products/cart",
      dataType: 'script',
      success: function(response) {
        var myModal = new bootstrap.Modal(document.getElementById('cart_modal'), {
        })
        myModal.show()
      },
      error: function(response) {
        console.log("error")
      }
    })
  }
