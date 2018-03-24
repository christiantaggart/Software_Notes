# Registry Editor (regedit) [tutorial]



#### Rules for editing the Registry safely:
> (VIA [tutorial]) Here are my five rules for safer Registry editing:

1. The ironclad rule of Registry editing is that you must first back up the Registry. For many, making a System Restore point is the most convenient backup method. I also use the export facility of Regedit to make a copy of the Registry key that I am working on. Keep in mind that Regedit has no Undo function.
- Know how to restore a Registry backup. It can be as simple as running System Restore or merging a backup REG file.
- Make only one Registry edit at a time. Wait to see if everything works the way you want before making any more changes to the Registry. Don't forget that many Registry edits require that you log off or reboot before they take effect.
- Only use Registry edits recommended by known reliable sources. Many of the common recommendations on the Internet are useless or nearly so. And some are even harmful.
- Remember Rule #1.

#### How to Open Registry Editor
- Open the Run box with the keyboard combination `Windows key + r`
- In the Run line, enter `regedit`
- Click **OK**
- Say **Yes** to User Account Control (Windows Vista/7/8.x/10)


#### Tree Structure:
**Table I. Root keys or Hives**

|Keys	|Abbreviation	|Description|
|:--|---|---|
|HKEY_CLASSES_ROOT|	HKCR	|Stores file association and COM object registration|
|HKEY_CURRENT_USER	|HKCU|	Stores data associated with the account currently logged on|
|HKEY_LOCAL_MACHINE	|HKLM	|Stores system-related information|
|HKEY_USERS	|HKU|	Stores information about all the accounts on the machine|
|HKEY_CURRENT_CONFIG	|HKCC|	Stores information about the current machine profile|

---
[tutorial]: http://www.techsupportalert.com/content/learn-how-use-windows-registry-editor-regedit-one-easy-lesson.htm
