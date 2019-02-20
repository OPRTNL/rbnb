import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('cabin_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export default initAutocomplete;
