package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1208:BigInteger;
      
      private var var_606:BigInteger;
      
      private var var_1477:BigInteger;
      
      private var var_1478:BigInteger;
      
      private var var_1816:BigInteger;
      
      private var var_1691:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1208 = param1;
         var_1477 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1816.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1478 = new BigInteger();
         var_1478.fromRadix(param1,param2);
         var_1816 = var_1478.modPow(var_606,var_1208);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1691.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1208.toString() + ",generator: " + var_1477.toString() + ",secret: " + param1);
         var_606 = new BigInteger();
         var_606.fromRadix(param1,param2);
         var_1691 = var_1477.modPow(var_606,var_1208);
         return true;
      }
   }
}
