/**
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|               JS-Code by "Pixxa & Kyonax" Synchronous members                 |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                        code JS from Montgomery Country RP                     |---
---|                               Resource-JS: [init]                             |---
---|                                Name-JS: [Button]                              |---
---|              Function-JS: Execute all the scripts button functions            |---
---|                                                                               |---
---|                            DEV-DATE: 21/06/2020                               |---
---|                                number: 002                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•--- 
 */
function eyeButton() {
  var input_password = document.getElementById("password");
  var un_hidde_password = document.getElementById("unhide-password");
  var hidde_password = document.getElementById("hide-password");

  if (input_password.type === "password") {
    input_password.type = "text";
    hidde_password.style.display = "inline-block";
    un_hidde_password.style.display = "none";
  } else {
    input_password.type = "password";
    hidde_password.style.display = "none";
    un_hidde_password.style.display = "inline-block";
  }
} //Function that hide or unhide the Password

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
