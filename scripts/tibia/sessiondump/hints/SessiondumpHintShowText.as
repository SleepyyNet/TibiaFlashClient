package tibia.sessiondump.hints
{
   import shared.utility.Vector3D;
   import tibia.worldmap.WorldMapStorage;
   import tibia.chat.ChatStorage;
   import tibia.chat.MessageMode;
   
   public class SessiondumpHintShowText extends SessiondumpHintBase
   {
      
      private static var FIELD_CONDITIONDATA:String = "conditiondata";
      
      private static var FIELD_COORDINATE:String = "coordinate";
      
      private static var FIELD_SESSIONDUMP:String = "sessiondump";
      
      private static var FIELD_DESTINATION_COORDINATE:String = "destination";
      
      private static var FIELD_CHANNEL:String = "channel";
      
      private static var FIELD_TYPE:String = "type";
      
      private static var FIELD_CONDITIONTYPE:String = "conditiontype";
      
      private static var FIELD_USE_TYPE_ID:String = "usetypeid";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_TORSO:String = "color-torso";
      
      private static var FIELD_OBJECTTYPE:String = "objecttype";
      
      private static var CONDITION_TYPE_CLICK_CREATURE:String = "CLICK_CREATURE";
      
      private static var FIELD_OBJECTTYPEID:String = "objecttypeid";
      
      private static var FIELD_POSITION:String = "position";
      
      private static var FIELD_TARGET:String = "target";
      
      private static var FIELD_PLAYER_OUTFIT:String = "player-outfit";
      
      private static var FIELD_UIELEMENT:String = "uielement";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_DETAIL:String = "color-detail";
      
      private static var FIELD_MULTIUSE_TARGET:String = "multiusetarget";
      
      private static var FIELD_CHANNEL_ID:String = "channelid";
      
      private static var FIELD_CREATURE_ID:String = "creatureid";
      
      private static var CONDITION_TYPE_DRAG_DROP:String = "DRAG_DROP";
      
      private static var FIELD_MULTIUSE_OBJECT_POSITION:String = "multiuseobjectposition";
      
      private static var FIELD_PLAYER_NAME:String = "player-name";
      
      private static var FIELD_PLAYER_OUTFIT_ID:String = "id";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_LEGS:String = "color-legs";
      
      private static var FIELD_SKIP_TO_TIMESTAMP:String = "skiptotimestamp";
      
      private static var FIELD_MULTIUSE_OBJECT_ID:String = "multiuseobjectid";
      
      private static var FIELD_TUTORIAL_PROGRESS:String = "tutorialprogress";
      
      private static var FIELD_TIMESTAMP:String = "timestamp";
      
      public static const TYPE:String = "SHOW_TEXT";
      
      private static var FIELD_PLAYER_OUTFIT_ADDONS:String = "add-ons";
      
      private static var FIELD_AMOUNT:String = "amount";
      
      private static var FIELD_OBJECTID:String = "objectid";
      
      private static var FIELD_CREATURE_NAME:String = "creaturename";
      
      private static var CONDITION_TYPE_CLICK:String = "CLICK";
      
      private static var FIELD_OBJECTDATA:String = "objectdata";
      
      private static var FIELD_TEXT:String = "text";
      
      private static var FIELD_OBJECTINDEX:String = "objectindex";
      
      private static var FIELD_SOURCE_COORDINATE:String = "source";
      
      private static var FIELD_PLAYER_OUTFIT_COLOR_HEAD:String = "color-head";
       
      private var m_Coordinate:Vector3D = null;
      
      private var m_ChannelID:uint = 0;
      
      private var m_Text:String = "";
      
      public function SessiondumpHintShowText()
      {
         super();
         m_Type = TYPE;
      }
      
      public static function s_Unmarshall(param1:Object) : SessiondumpHintBase
      {
         var _loc3_:Object = null;
         var _loc2_:SessiondumpHintShowText = new SessiondumpHintShowText();
         if(FIELD_COORDINATE in param1)
         {
            _loc3_ = param1[FIELD_COORDINATE] as Object;
            _loc2_.m_Coordinate = new Vector3D(_loc3_["x"],_loc3_["y"],_loc3_["z"]);
         }
         if(FIELD_CHANNEL in param1)
         {
            _loc2_.m_ChannelID = uint(param1[FIELD_CHANNEL]);
         }
         if(FIELD_TEXT in param1)
         {
            _loc2_.m_Text = String(param1[FIELD_TEXT]);
         }
         return _loc2_;
      }
      
      override public function perform() : void
      {
         super.perform();
         var _WorldMapStorage:WorldMapStorage = Tibia.s_GetWorldMapStorage();
         var _ChatStorage:ChatStorage = Tibia.s_GetChatStorage();
         try
         {
            _WorldMapStorage.addOnscreenMessage(this.m_Coordinate,-1,null,0,MessageMode.MESSAGE_GAME,this.m_Text);
         }
         catch(e:Error)
         {
            throw new Error("SessiondumpHintShowText.perform: Failed to add message: " + e.message,1);
         }
         try
         {
            _ChatStorage.addChannelMessage(this.m_ChannelID,0,null,0,MessageMode.MESSAGE_GAME,this.m_Text);
         }
         catch(e:Error)
         {
            throw new Error("SessiondumpHintShowText.perform: Failed to add message: " + e.message,2);
         }
         m_Processed = true;
      }
   }
}
