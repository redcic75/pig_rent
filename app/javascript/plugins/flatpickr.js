import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#rental_start_date", {
    altInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#rental_end_date"})]
  });
}

export { initFlatpickr };
