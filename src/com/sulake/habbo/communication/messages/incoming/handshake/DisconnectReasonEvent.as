package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1536:int = 5;
      
      public static const const_1688:int = 113;
      
      public static const const_1707:int = 29;
      
      public static const const_1563:int = 0;
      
      public static const const_1672:int = 102;
      
      public static const const_1556:int = 25;
      
      public static const const_1642:int = 20;
      
      public static const const_1589:int = 116;
      
      public static const const_1510:int = 114;
      
      public static const const_1503:int = 101;
      
      public static const const_1506:int = 108;
      
      public static const const_1488:int = 112;
      
      public static const const_1545:int = 100;
      
      public static const const_1514:int = 24;
      
      public static const const_1215:int = 10;
      
      public static const const_1481:int = 111;
      
      public static const const_1544:int = 23;
      
      public static const const_1675:int = 26;
      
      public static const const_1175:int = 2;
      
      public static const const_1565:int = 22;
      
      public static const const_1610:int = 17;
      
      public static const const_1552:int = 18;
      
      public static const const_1575:int = 3;
      
      public static const const_1579:int = 109;
      
      public static const const_1294:int = 1;
      
      public static const const_1644:int = 103;
      
      public static const const_1696:int = 11;
      
      public static const const_1616:int = 28;
      
      public static const const_1695:int = 104;
      
      public static const const_1611:int = 13;
      
      public static const const_1527:int = 107;
      
      public static const const_1638:int = 27;
      
      public static const const_1547:int = 118;
      
      public static const const_1705:int = 115;
      
      public static const const_1518:int = 16;
      
      public static const const_1591:int = 19;
      
      public static const const_1678:int = 4;
      
      public static const const_1567:int = 105;
      
      public static const const_1492:int = 117;
      
      public static const const_1486:int = 119;
      
      public static const const_1685:int = 106;
      
      public static const const_1617:int = 12;
      
      public static const const_1482:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1294:
            case const_1215:
               return "banned";
            case const_1175:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
