package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import deng.fzip.FZipErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_484:uint = 0;
      
      private var var_93:FZip;
      
      private var var_1194:Array;
      
      private var var_1788:uint = 0;
      
      private var var_829:int = 0;
      
      private var _bytesTotal:uint = 0;
      
      public function ZipLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
         var_1194 = new Array();
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_93)
         {
            var_93.removeEventListener(Event.COMPLETE,onComplete);
            var_93.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_93.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_93.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
            var_93.removeEventListener(FZipErrorEvent.const_123,onParseError);
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         debug("Load event IO ERROR for file \"undefined\"");
         if(!handleHttpStatus(var_149))
         {
            failure("IO Error, load operation failed for file \"undefined\" (" + var_484 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_484;
      }
      
      private function onParseError(param1:FZipErrorEvent) : void
      {
         debug("Load event parse error for file \"undefined\"");
         if(!handleHttpStatus(var_149))
         {
            failure("Parse Error, load operation failed for file \"undefined\" (" + var_484 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return _bytesTotal;
      }
      
      public function get resources() : Array
      {
         return var_1194;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var name:String = null;
         var event:Event = param1;
         try
         {
            name = getQualifiedClassName(var_14.content);
            var_1194.push(var_14.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_829;
            if(var_1194.length == var_1788)
            {
               var_14.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               var_665 = true;
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,_bytesTotal,var_484));
            }
            else
            {
               var_14.loadBytes(var_93.getFileAt(var_829).content);
            }
         }
         catch(e:Error)
         {
            failure("Crashed on ZipLoader.onLoaderComplete: \"undefined\" (" + var_484 + "/" + _bytesTotal + " bytes): " + e.message);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         _bytesTotal = param1.bytesTotal;
         var_484 = param1.bytesLoaded;
         debug("Load event PROGRESS for file \"undefined\"");
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,_bytesTotal,var_484));
      }
      
      override public function load(param1:URLRequest, param2:int = 5) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_41 = param1;
         _name = method_4(var_41.url);
         var_293 = param2;
         if(var_93)
         {
            var_93.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_93 = new FZip();
         var_93.addEventListener(Event.COMPLETE,onComplete);
         var_93.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_93.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_93.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_93.addEventListener(FZipErrorEvent.const_123,onParseError);
         if(!var_461)
         {
            var_93.load(var_41);
         }
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(var_293 > 0)
            {
               if(var_93)
               {
                  var_93.close();
               }
               addRequestCounterToUrlRequest(var_41,const_855 - var_293);
               if(var_1145)
               {
                  var_41.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_41.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1145 = false;
               }
               var_93.load(var_41);
               --var_293;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_41.url + "\" (" + var_484 + "/" + _bytesTotal + " bytes)");
            removeEventListeners();
         }
         return false;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_829 = 0;
         var_1788 = var_93.getFileCount();
         debug("Load event COMPLETE for file \"undefined\"");
         removeEventListeners();
         try
         {
            if(var_14)
            {
               var_14.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_14.loadBytes(var_93.getFileAt(var_829).content);
            }
         }
         catch(e:Error)
         {
            debug("Failed to extract files from library \"undefined\"");
            if(!handleHttpStatus(var_149))
            {
               failure("Crashed on ZipLoader.onComplete: \"undefined\" (" + var_484 + "/" + _bytesTotal + " bytes): " + e.message);
            }
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_149 = param1.status;
         debug("Load event STATUS " + var_149 + " for file \"" + var_41.url + "\"");
      }
      
      override public function resume() : void
      {
         if(var_461 && !_disposed)
         {
            var_461 = false;
            if(!var_665 && var_41)
            {
               var_93.load(var_41);
            }
         }
      }
   }
}
