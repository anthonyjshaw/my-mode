// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

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
import 'bootstrap';
import 'trix'
// import '@rails/actiontext'

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// eslint-disable-next-line import/first, semi
import { addActiveClassNav } from './add_active_class_nav';
import { initServiceWorker } from './initServiceWorker'
// eslint-disable-next-line import/first
import { addDisableAttrToItemSelect } from './addDisableAttrToItemSelect'
import { disableCommentBtn } from './disableCommentBtn'
import { changeReplyText } from './changeReplyText'
import 'controllers'

require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
require('@rails/actiontext')
// const Trix = require('trix')

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  addActiveClassNav()
  initServiceWorker()
  addDisableAttrToItemSelect()
  // eslint-disable-next-line padded-blocks, semi
  disableCommentBtn();
  changeReplyText()

  //   Trix.config.blockAttributes.heading2 = {
  //     tagName: 'h2'
  //   }
  //   Trix.config.blockAttributes.heading3 = {
  //     tagName: 'h3'
  //   }
  //   Trix.config.textAttributes.underline = {
  //     tagName: 'u'
  //   }

  //   const { lang } = Trix.config
  //   console.log('Config', Trix.config)

  //   Trix.config.toolbar = {
  //     getDefaultHTML () {
  //       return `\
  //       <div class="trix-button-row">
  //         <span class="trix-button-group trix-button-group--text-tools" data-trix-button-group="text-tools">
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-bold" data-trix-attribute="bold" data-trix-key="b" title="${lang.bold}" tabindex="-1">${lang.bold}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-italic" data-trix-attribute="italic" data-trix-key="i" title="${lang.italic}" tabindex="-1">${lang.italic}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-strike" data-trix-attribute="strike" title="${lang.strike}" tabindex="-1">${lang.strike}</button>
  //           <button type="button" class="trix-button  " data-trix-attribute="underline" title="h3" tabindex="-1">u</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-link" data-trix-attribute="href" data-trix-action="link" data-trix-key="k" title="${lang.link}" tabindex="-1">${lang.link}</button>
  //         </span>
  //         <span class="trix-button-group trix-button-group--block-tools" data-trix-button-group="block-tools">
  //           <button type="button" class="trix-button  " data-trix-attribute="heading1" title="h1" tabindex="-1">h1</button>
  //           <button type="button" class="trix-button  " data-trix-attribute="heading2" title="h2" tabindex="-1">h2</button>
  //           <button type="button" class="trix-button  " data-trix-attribute="heading3" title="h3" tabindex="-1">h3</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-quote" data-trix-attribute="quote" title="${lang.quote}" tabindex="-1">${lang.quote}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-code" data-trix-attribute="code" title="${lang.code}" tabindex="-1">${lang.code}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-bullet-list" data-trix-attribute="bullet" title="${lang.bullets}" tabindex="-1">${lang.bullets}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-number-list" data-trix-attribute="number" title="${lang.numbers}" tabindex="-1">${lang.numbers}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-decrease-nesting-level" data-trix-action="decreaseNestingLevel" title="${lang.outdent}" tabindex="-1">${lang.outdent}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-increase-nesting-level" data-trix-action="increaseNestingLevel" title="${lang.indent}" tabindex="-1">${lang.indent}</button>
  //         </span>
  //         <span class="trix-button-group trix-button-group--file-tools" data-trix-button-group="file-tools">
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-attach" data-trix-action="attachFiles" title="${lang.attachFiles}" tabindex="-1">${lang.attachFiles}</button>
  //         </span>
  //         <span class="trix-button-group-spacer"></span>
  //         <span class="trix-button-group trix-button-group--history-tools" data-trix-button-group="history-tools">
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-undo" data-trix-action="undo" data-trix-key="z" title="${lang.undo}" tabindex="-1">${lang.undo}</button>
  //           <button type="button" class="trix-button trix-button--icon trix-button--icon-redo" data-trix-action="redo" data-trix-key="shift+z" title="${lang.redo}" tabindex="-1">${lang.redo}</button>
  //         </span>
  //       </div>
  //       <div class="trix-dialogs" data-trix-dialogs>
  //         <div class="trix-dialog trix-dialog--link" data-trix-dialog="href" data-trix-dialog-attribute="href">
  //           <div class="trix-dialog__link-fields">
  //             <input type="url" name="href" class="trix-input trix-input--dialog" placeholder="${lang.urlPlaceholder}" aria-label="${lang.url}" required data-trix-input>
  //             <div class="trix-button-group">
  //               <input type="button" class="trix-button trix-button--dialog" value="${lang.link}" data-trix-method="setAttribute">
  //               <input type="button" class="trix-button trix-button--dialog" value="${lang.unlink}" data-trix-method="removeAttribute">
  //             </div>
  //           </div>
  //         </div>
  //       </div>\
  //     `
  //     }
  //   }
})
