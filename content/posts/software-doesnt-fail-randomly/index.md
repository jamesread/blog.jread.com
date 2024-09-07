---
title: "Software Doesn't Fail Randomly"
date: 2024-09-07T20:46:24+01:00
tags:
  - code
---

In my very first job interview out of University, I was asked a question that I have never forgotten. The interviewer asked me "What skills do you think you have, that other people don't?". Context is important, I was 21, I'd never had a professional job in IT before, and I was applying for a job as a Systems Engineer. What came to mind quite quickly, was that I've been programming since I was about 11 or 12 years old, and it's given me an appreciation for why software fails.

In a Systems Engineer role, I was working with lots of different operating systems, applications and hardware - none of which I'd ever seen before. Coming in to this role with a programming background, I felt that I knew better than the average graduate how to read error messages, how to debug problems, and how to fix them.

Let's start with a trivial example, how many times have you seen an error message like "Unexpected condition: 13", or "Unhandled exception: 0x80000003"? Software that I had written had many error messages generated like those, so when I saw them, I could get a feel for what the program was doing. Most often, errors like that are due to a list of issues or errors that ARE expected, and handled, and this error message is the "catch all". Let me demonstrate with a bit of PHP (which I wrote a lot of at the time!);

```php

function checkSetting() {
	$error = parseSettingsFile('settings.json');
	
	switch ($error) {
		case 10: return "Settings file not found";
		case 11: return "Settings file is not readable";
		case 12: return "Settings file is not valid JSON";
		default:
			return: "Unexpected condition: $error";
	}
}
```

This code is absolute nonsense, but it demonstrates how we would get an "Unexpected condition" error message. Here's the point I'm trying to make - software doesn't fail randomly, that error message is there for a reason. It's there to tell you that the programmer never thought that error code 13 (or 1-9, or anything above 12) would ever occur. It's not random at all. 

In the interview, I made the point that many people don't have a feeling for this. Many technical people, even, think that if they just "try again", they might get a different message (they might, sure, but it's not like a probability, it's not going to work 50% of the time and fail 50% of the time). So many experienced technical people think that software and computers have personalities, or moods, or that they're indeterminate in some way. They're not. They're deterministic, and they're predictable.

If it worked the second time you tried, that's because something changed the second time.

If it worked after you rebooted, that's because something changed when you rebooted.

If it worked after you reinstalled, that's because something changed when you reinstalled.

I experience this even with really experienced technologists, architects, and even worse, developers! Above all, developers should know that these things are not "random". You may not know what changed, and you may not understand (this certainly happens to me, too!), but it's not random. Sometimes these things are REALLY hard to diagnose as well, it can be race conditions in the code, or intermitant failures in hardware, or even cosmic rays flipping bits in memory! But, it's not random.

If you find yourself trying to diagnose a problem and you're not sure what is going on, the most important thing you can do is change one variable at a time. Rebooting, restarting and reinstalling is the worst way to "solve" these problems - it doesn't help you diagnose the root cause. If you change one thing at a time, you can slowly understand exactly what is causing the problem, and then you can fix it.
