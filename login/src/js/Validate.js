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
---|                            DEV-DATE: 21/06/2020                               |---
---|                                number: 003                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•--- 
 */
function validateForm() {
  const user_input = document.getElementById("user").value;
  const password_input = document.getElementById("password").value;
  const error_tooltip = document.getElementById("error");
  const error_label_tooltip = document.querySelector(".error:nth-child(5)");
  //Eventos MTA
  if (user_input == "") {
    error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 1]";
    error_tooltip.style.display = "initial";
    error_tooltip.style.top = "43.8%";
    error_label_tooltip.style = "display: none";
    return false;
  } else {
    error_tooltip.style.display = "none";
    if (password_input == "") {
      error_tooltip.innerHTML = "Este campo no puede estar vacío [ERROR 2]";
      error_tooltip.style.display = "initial";
      error_tooltip.style.top = "52.2%";
      error_label_tooltip.style = "display: none";
      return false;
    } else {
      error_tooltip.style.display = "none";
      mta.triggerEvent("login-browser:sendData", user_input, password_input);
      return false;
    }
  }
} //Validate if the User and Password inputs are Fill, then Trigger a Lua Event
