/**
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|               JS-Code by "Pixxa & Kyonax" Synchronous Developers              |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|  Github: https://github.com/MrPixxa-games • G-Mail: pixxaunited@gmail.com     |---
---|                        code JS from Montgomery Country RP                     |---
---|                               Resource-JS: [init]                             |---
---|                                Name-JS: [Button]                              |---
---|              Function-JS: Execute all the scripts button functions            |---
---|                                                                               |---
---|                            DEV-DATE: 21/06/2020                               |---
---|                                number: 002                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•--- 
 */
function mouseOver() {
  var button_rounded = document.getElementById("button-rounded");
  var triangle_button = document.getElementById("button-triangle");

  button_rounded.classList.add("button-triangle-background-hover");
} //Function that add a visual effect to the Background Button

function mouseOut() {
  var button_rounded = document.getElementById("button-rounded");
  var triangle_button = document.getElementById("button-triangle");

  button_rounded.classList.remove("button-triangle-background-hover");
} //Function that removes a visual effect to the Background Button
