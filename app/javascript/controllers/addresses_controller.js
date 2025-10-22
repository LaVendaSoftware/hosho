import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="addresses"
export default class extends Controller {
  static targets = [
    "source",
    "country",
    "zipCode",
    "rawAddress",
    "streetName",
    "district",
    "city",
    "state",
  ];

  async change() {
    await this.fetchAddress(this.zipCodeTarget.value);
  }

  async fetchAddress(zipCode) {
    if (zipCode.replace(/\D/g, "").length !== 8) return;

    try {
      const response = await fetch(`/addresses/${zipCode}`, {
        method: "GET",
        headers: { Accept: "application/json" },
      });

      if (!response.ok) {
        throw new Error(`Response status: ${response.status}`);
      }

      const address = await response.json();

      this.sourceTarget.value = address.source;
      this.countryTarget.value = address.country;
      this.zipCodeTarget.value = address.zip_code;
      this.rawAddressTarget.value = JSON.stringify(address.raw_address);
      this.streetNameTarget.value = address.street_name;
      this.districtTarget.value = address.district;
      this.cityTarget.value = address.city;
      this.stateTarget.value = address.state;
    } catch (error) {
      this.sourceTarget.value = "unknown";
      this.rawAddressTarget.value = "{}";
      console.error(error.message);
    }
  }
}
