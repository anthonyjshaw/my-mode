// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
// eslint-disable-next-line import/first, semi
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// eslint-disable-next-line import/first, semi
import { addActiveClassNav } from './add_active_class_nav';
import { initServiceWorker } from './initServiceWorker';
// eslint-disable-next-line import/first
import { addDisableAttrToItemSelect} from './addDisableAttrToItemSelect';
import { disableCommentBtn } from './disableCommentBtn';
import { changeReplyText } from './changeReplyText';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  addActiveClassNav();
  initServiceWorker();
  addDisableAttrToItemSelect();
  // eslint-disable-next-line padded-blocks, semi
  disableCommentBtn();
  changeReplyText();



});
