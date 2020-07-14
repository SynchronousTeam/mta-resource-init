/**
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|               JS-Code by "Pixxa & Kyonax" Synchronous Developers              |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|  Github: https://github.com/MrPixxa-games • G-Mail: pixxaunited@gmail.com     |---
---|                        code JS from Montgomery Country RP                     |---
---|                               Resource-JS: [init]                             |---
---|                               Name-JS: [Validate]                             |---
---|        Function-JS: Validate a full inputs then Trigger a Lua Event           |---
---|                                                                               |---
---|                            DEV-DATE: 13/07/2020                               |---
---|                                number: 003                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•--- 
 */
function validateForm() {
  const user_input = document.getElementById("user").value;
  const password_input = document.getElementById("password").value;
  const discord_input = document.getElementById("discord").value;
  const repeat_password_input = document.getElementById("repeat-password")
    .value;
  const error_tooltip = document.getElementById("error");
  const error_label_tooltip = document.querySelector(".error:nth-child(5)");
  //Eventos MTA
  if (user_input == "") {
    error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 4]";
    error_tooltip.style.display = "initial";
    error_tooltip.style.top = "26.8%";
    error_tooltip.style.left = "12%";
    error_label_tooltip.style = "display: none";
    return false;
  } else {
    error_tooltip.style.display = "none";
    if (password_input == "") {
      error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 5]";
      error_tooltip.style.display = "initial";
      error_tooltip.style.top = "48.2%";
      error_tooltip.style.left = "12%";
      error_label_tooltip.style = "display: none";
      return false;
    } else if (discord_input == "") {
      error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 6]";
      error_tooltip.style.display = "initial";
      error_tooltip.style.top = "26.8%";
      error_tooltip.style.left = "58%";
      error_label_tooltip.style = "display: none";
      return false; 
    } else if (repeat_password_input == "") {
      error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 7]";
      error_tooltip.style.display = "initial";
      error_tooltip.style.top = "48.2%";
      error_tooltip.style.left = "58%";
      error_label_tooltip.style = "display: none";
      return false;
    }
  }
} //Validate if the User and Password inputs are Fill, then Trigger a Lua Event
