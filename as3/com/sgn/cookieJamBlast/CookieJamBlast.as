package com.sgn.cookieJamBlast {
  import flash.events.StatusEvent;
  import flash.external.ExtensionContext;
  import flash.utils.getQualifiedClassName;

  /**
   * CookieJamBlast extension
   */
  public class CookieJamBlast {
    //---------------------------------------------------------------------
    //
    // Constants
    //
    //---------------------------------------------------------------------
    private static const EXTENSION_ID:String = "com.sgn.cookieJamBlast";

    //---------------------------------------------------------------------
    //
    // Private Properties.
    //
    //---------------------------------------------------------------------
    private static var context:ExtensionContext;
    private static var _objectPool:Object = {};
    private static var _objectPoolId:int = 0;
    private static var _instance:CookieJamBlast;

    //---------------------------------------------------------------------
    //
    // Public Methods.
    //
    //---------------------------------------------------------------------
    public function CookieJamBlast() {
      if (_instance)
        throw new Error("Singleton");
      _instance = this;
    }

    public static function init():void {
      // This is just so that the extension is initialized
    }

    public function getQualifiedClassName(obj:Object):String {
      return flash.utils.getQualifiedClassName(obj);
    }

    public function enumerateObjectProperties(obj:Object):Array {
      var keys:Array = [];
      for (var key:String in obj)
        keys.push(key);
      return keys;
    }

    public function __retainObject(obj:Object):int {
      _objectPool[++_objectPoolId] = obj;
      return _objectPoolId;
    }

    public function __getObject(id:int):Object {
      return _objectPool[id];
    }

    //---------------------------------------------------------------------
    //
    // Private Methods.
    //
    //---------------------------------------------------------------------
    private static function context_statusEventHandler(event:StatusEvent):void {
      if (event.level == "TICKET")
        context.call("claimTicket", event.code);
      else if (event.level == "RELEASE")
        delete _objectPool[int(event.code)];
    }

    {
      new CookieJamBlast();
      context = ExtensionContext.createExtensionContext(EXTENSION_ID, EXTENSION_ID + ".CookieJamBlast");
      if (context) {
        try {
          context.addEventListener(StatusEvent.STATUS, context_statusEventHandler);
          context.call("setActionScriptThis", _instance);
        } catch (e:ArgumentError) {
          context = null;
        }
      }
    }
  }
}
