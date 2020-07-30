/**
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|               JS-Code by "Pixxa & Kyonax" Synchronous Developers              |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|  Github: https://github.com/MrPixxa-games • G-Mail: pixxaunited@gmail.com     |---
---|                        code JS from Montgomery Country RP                     |---
---|                               Resource-JS: [init]                             |---
---|                               Name-JS: [Register]                             |---
---|            Function-JS: On click Lonk register Trigger a Lua Event            |---
---|                                                                               |---
---|                            DEV-DATE: 21/06/2020                               |---
---|                                number: 004                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•--- 
 */
function callRegister() {
  mta.triggerEvent("base-camera-register:show");
  return false;
} //When the User Click on the Link Register this function Call a Lua Event
