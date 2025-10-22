import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="order-items"
export default class extends Controller {
  static targets = ["productVariantId", "unitPrice", "quantity", "subtotal"];

  async connect() {
    await this.fetchOrderItem();
  }

  async change() {
    await this.fetchOrderItem();
  }

  async fetchOrderItem() {
    const productVariantId = this.productVariantIdTarget.value;
    if (!productVariantId) return;

    const queryString = new URLSearchParams({
      product_variant_id: productVariantId,
      quantity: this.quantityTarget.value,
    }).toString();

    try {
      const response = await fetch(`/order_items/new?${queryString}`, {
        method: "GET",
        headers: { Accept: "application/json" },
      });

      if (!response.ok) {
        throw new Error(`Response status: ${response.status}`);
      }

      const orderItem = await response.json();
      const { unit_price: unitPrice, subtotal } = orderItem;

      this.unitPriceTarget.value = unitPrice;
      this.subtotalTarget.value = subtotal;
    } catch (error) {
      console.error(error.message);
    }
  }
}
