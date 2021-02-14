
import Rails from "@rails/ujs"
import * as bootstrap from 'bootstrap'
import toastr from "toastr";

  export function add_to_cart(product_id) {
    Rails.ajax({
      type: "POST",
      url: "/products/" + product_id + "/add_to_cart",
      success: function(response) {
        toastr.success("Товар доданий до кошика")
        console.log("succses response")
      },
      error: function(response) {
        console.log("error")
      }
    })
  }
  export function remove_from_cart(product_id) {
    Rails.ajax({
      type: "DELETE",
      url: "/products/" + product_id + "/remove_from_cart",
      success: function(response) {
        var cart_product = document.getElementById('product_'+product_id)
        cart_product.remove()
        toastr.success("Товар видалено з кошика")
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
  export function cart_product_change_count(product_id,count){
    Rails.ajax({
      type: "PATCH",
      url: "/products/" + product_id + "/change_count_in_cart",
      data: "count="+count,
      success: function(response) {
        toastr.success("Зміна кількості товару")
      },
      error: function(response) {
        console.log("error")
      }
    })
  }
