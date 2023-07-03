---
title: "Google Rehab"
date: 2023-07-03T09:47:50+01:00
draft: false
---

I signed up for a Google account when I was still in University, in 2006.
# Test

This is a test. 

```
asdf
```

asdf


Use Firefox as a universal web chat app
Chat that is always compatible, updated, and integrates with browser extensions.
Too many chat apps - can't change that.
The amount of chat applications and protocols out there now-a-days is getting absolutely crazy. It's like in the 1990s, when we had ICQ, AIM, IRC, and others. For a little while, I felt like things were getting better - I got down to just 2 chat apps!…
Fast-forward to today - the chat apps I need are unfortunately even more than in the 90s. However, something that has changed for the good: thankfully all of them have web-based versions. Here are all the webchat options I have loaded in Firefox now;
Google Chat - http://chat.google.com (corporate version)
WhatsApp - http://web.whatsapp.com
Slack - http://example.slack.com
Facebook Messenger - http://messenger.com
Telegram - http://web.telegram.com
Microsoft teams - http://teams.microsoft.com
Steam -http://steamcommunity.com/chat

I have tried using universal chat apps like Pidgin/libpurple, and universal chat clients like Franz. Actually, Franz was very good, but it's a heavy, bloated, slow electron app that needs updating on my system.
Also, if you've ever tried getting friends, family or co-workers all into one chat - good luck! When my Family went from Facebook Messenger to WhatsApp (which I loathe), it added another annoying protocol that only works off a cellualr connection! Agh, SMS would have been better than WhatsApp!
A tab for each chat client
However, managing all these in little tabs at the top of my screen would be really frustrating - from my screenshot above you can see I have a really nice "chat sidebar" in Firefox. The benefits of this approach have been;
All the chat clients are always up to date (because they're web chat)
All the chat clients are compatible - by which I mean that they all support image-sending/receiving, audio, video, etc - which many "universal chat clients" like Pidgin unfortunately cannot do.
Always fast - Firefox rules. No spying, it's open source, and uses 30Gb less RAM than Chrome :-)
Integrates automatically with browser extensions - for me the critical ones are; 1) BitWarden (for passwords) and 2) LanguageTool (an open-source Grammarly).

Obviously, notifications and similar all work just fine, too! :)
So, how do you get that Firefox "chat sidebar"?
First, go and grab this Tab Sidebar Firefox addon; https://addons.mozilla.org/en-GB/firefox/addon/tab-sidebar-we/
After install, you'll get a very basic looking sidebar. We're not done yet - the brilliant thing about this add-on is that it allows custom CSS- custom styles, so we can make the icons much larger, and the text much smaller.
Go into Tab Sidebar settings by clicking the top right menu, and go to "Preferences";
You should get a "Tab Sidebar Options" screen, and one tab should be called "Override Style Sheet", like this;
In that code box, here is the CSS code I am using;
img {
  width: .8em !important;
  height: .8em !important;
  margin: auto !important;
}
[data-ctl=items] {
  font-size: 3em;
}
[data-title] {
  display: none;
  font-size: 1em;
  font-weight: bold;
  color: black;
}
This should get you something that looks like this;
You can see I have Gmail, and Google search open as well - because it works with any tab at all.
How do you shrink the sidebar to be so small?
Lastly, you might be wondering how to minimize the sidebar to make it so thin. It seems in Firefox, that this has a "minimum width". That is easily fixable by using the Browser developer toolox to just hack away at the minimum width. The first time you do this you'll have to enable the browser toolbox.
Open Web Developer Tools;

2. In the web developer tools go to "Settings";
3. Under Advanced Settings, tick "Enable browser chrome and add-on debugging toolboxes", as well as "Enable remote debugging";
4. You can close the regular "Web Developer Tools" window/sidebar, and now open then "Browser Toolbox".
You will probably get a prompt asking if you want to allow remote debugging. Allow it - it's only listening on localhost. Lastly, in this Browser Toolbox window/sidebar, switch to the "Console" tab, and enter this JavaScript;
document.querySelector("#sidebar").style.minWidth = "1em"
You should now be able to resize the sidebar to be much thinner than is normally allowed - making it quite pretty for using as chat.
You will need to re-enter this code if you restart your browser, but you don't need to re-enable the toolbox, Firefox remembers the code you typed - just press "Up" on your keyboard to go to it in your history.
Summary
Firefox rocks. Electron apps suck. :) This tip made me massively more productive with all the chat's I monitor.
