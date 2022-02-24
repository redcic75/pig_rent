import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr("#rental_start_date", {
    minDate: "today",
    dateFormat: "d F Y",
    mode: "range"
  });
}

export { initFlatpickr };
