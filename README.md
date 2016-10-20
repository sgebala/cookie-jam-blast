CookieJamBlast ANE
=================

Gradle Setup
------------
https://socialgamingnetwork.jira.com/wiki/display/GS/ANE+Gradle+Plugin+Setup

iOS
---
Additions to Info.plist:

        <key></key><string></string>

Android
-------
Additions to the android manifest:

        <manifestAdditions><![CDATA[
          <manifest android:installLocation="auto">
            <uses-permission android:name="android.permission.INTERNET"/>
            <application android:enabled="true" @ANDROID_DEBUGGABLE@>
              <activity android:name="com.jesusla.ane.CustomActivity"/>
              <meta-data android:name="" android:value=""/>
            </application>
          </manifest>
        ]]></manifestAdditions>

Usage
-----
