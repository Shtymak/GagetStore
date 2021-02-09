import Rails from "@rails/ujs"
export function add_to_cart(product_id){
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
