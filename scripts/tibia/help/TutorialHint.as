package tibia.help
{
   import tibia.input.IActionImpl;
   import tibia.sidebar.SideBarSet;
   import tibia.sidebar.Widget;
   import tibia.input.staticaction.StaticActionList;
   import tibia.options.OptionsStorage;
   import mx.events.CloseEvent;
   import shared.utility.StringHelper;
   import tibia.chat.MessageMode;
   import mx.resources.ResourceManager;
   import mx.resources.IResourceManager;
   
   public class TutorialHint implements IActionImpl
   {
      
      private static const BUNDLE:String = "TutorialHintWidget";
      
      private static const TUTORIAL_HINTS:Array = [null,{
         "ID":1,
         "name":"HINT_01_NAME",
         "text":"HINT_01_TEXT",
         "images":"HINT_01_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":2,
         "name":"HINT_02_NAME",
         "text":"HINT_02_TEXT",
         "images":"HINT_02_IMAGES",
         "showDialog":true,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            var _loc2_:* = null;
            if(_loc1_ != null && (_loc2_ = _loc1_.getSideBarSet(SideBarSet.DEFAULT_SET)) != null && _loc2_.countWidgetType(Widget.TYPE_MINIMAP,-1) < 1)
            {
               _loc2_.showWidgetType(Widget.TYPE_MINIMAP,SideBarSet.LOCATION_C,-1);
            }
         },
         "postDisplay":null
      },{
         "ID":3,
         "name":"HINT_03_NAME",
         "text":"HINT_03_TEXT",
         "images":"HINT_03_IMAGES",
         "showDialog":true,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            var _loc2_:* = null;
            if(_loc1_ != null && (_loc2_ = _loc1_.getSideBarSet(SideBarSet.DEFAULT_SET)) != null && _loc2_.countWidgetType(Widget.TYPE_GENERALBUTTONS,-1) < 1)
            {
               _loc2_.showWidgetType(Widget.TYPE_GENERALBUTTONS,SideBarSet.LOCATION_C,-1);
            }
         },
         "postDisplay":null
      },{
         "ID":4,
         "name":"HINT_04_NAME",
         "text":"HINT_04_TEXT",
         "images":"HINT_04_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":5,
         "name":"HINT_05_NAME",
         "text":"HINT_05_TEXT",
         "images":"HINT_05_IMAGES",
         "showDialog":true,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            var _loc2_:* = null;
            if(_loc1_ != null && (_loc2_ = _loc1_.getSideBarSet(SideBarSet.DEFAULT_SET)) != null)
            {
               if(_loc2_.countWidgetType(Widget.TYPE_BODY,-1) < 1)
               {
                  _loc2_.showWidgetType(Widget.TYPE_BODY,SideBarSet.LOCATION_C,-1);
               }
               if(_loc2_.getDefaultLocation(Widget.TYPE_CONTAINER) < 0)
               {
                  _loc2_.setDefaultLocation(Widget.TYPE_CONTAINER,SideBarSet.LOCATION_C);
               }
            }
         },
         "postDisplay":null
      },{
         "ID":6,
         "name":"HINT_06_NAME",
         "text":"HINT_06_TEXT",
         "images":"HINT_06_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":7,
         "name":"HINT_07_NAME",
         "text":"HINT_07_TEXT",
         "images":"HINT_07_IMAGES",
         "showDialog":false,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            var _loc2_:* = null;
            if(_loc1_ != null && (_loc2_ = _loc1_.getSideBarSet(SideBarSet.DEFAULT_SET)) != null)
            {
               if(_loc2_.countWidgetType(Widget.TYPE_COMBATCONTROL,-1) < 1)
               {
                  _loc2_.showWidgetType(Widget.TYPE_COMBATCONTROL,SideBarSet.LOCATION_C,-1);
               }
               if(_loc2_.getDefaultLocation(Widget.TYPE_BATTLELIST) < 0)
               {
                  _loc2_.setDefaultLocation(Widget.TYPE_BATTLELIST,SideBarSet.LOCATION_C);
               }
            }
         },
         "postDisplay":null
      },{
         "ID":8,
         "name":"HINT_08_NAME",
         "text":"HINT_08_TEXT",
         "images":"HINT_08_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":9,
         "name":"HINT_09_NAME",
         "text":"HINT_09_TEXT",
         "images":"HINT_09_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":10,
         "name":"HINT_10_NAME",
         "text":"HINT_10_TEXT",
         "images":"HINT_10_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":11,
         "name":"HINT_11_NAME",
         "text":"HINT_11_TEXT",
         "images":"HINT_11_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":12,
         "name":"HINT_12_NAME",
         "text":"HINT_12_TEXT",
         "images":"HINT_12_IMAGES",
         "showDialog":false,
         "preDisplay":function():void
         {
            StaticActionList.MISC_SHOW_OUTFIT.perform();
         },
         "postDisplay":null
      },{
         "ID":13,
         "name":"HINT_13_NAME",
         "text":"HINT_13_TEXT",
         "images":"HINT_13_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":14,
         "name":"HINT_14_NAME",
         "text":"HINT_14_TEXT",
         "images":"HINT_14_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":15,
         "name":"HINT_15_NAME",
         "text":"HINT_15_TEXT",
         "images":"HINT_15_IMAGES",
         "showDialog":false,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":16,
         "name":"HINT_16_NAME",
         "text":"HINT_16_TEXT",
         "images":"HINT_16_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":17,
         "name":"HINT_17_NAME",
         "text":"HINT_17_TEXT",
         "images":"HINT_17_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      },{
         "ID":18,
         "name":"HINT_18_NAME",
         "text":"HINT_18_TEXT",
         "images":"HINT_18_IMAGES",
         "showDialog":true,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            var _loc2_:* = null;
            if(_loc1_ != null && (_loc2_ = _loc1_.getSideBarSet(SideBarSet.DEFAULT_SET)) != null && _loc2_.countWidgetType(Widget.TYPE_COMBATCONTROL,-1) < 1)
            {
               _loc2_.showWidgetType(Widget.TYPE_COMBATCONTROL,SideBarSet.LOCATION_C,-1);
            }
         },
         "postDisplay":null
      },{
         "ID":19,
         "name":"HINT_19_NAME",
         "text":"HINT_19_TEXT",
         "images":"HINT_19_IMAGES",
         "showDialog":true,
         "preDisplay":function():void
         {
            var _loc1_:* = Tibia.s_GetOptions();
            if(_loc1_ != null && !_loc1_.statusWidgetVisible)
            {
               _loc1_.statusWidgetVisible = true;
            }
         },
         "postDisplay":null
      },{
         "ID":20,
         "name":"HINT_20_NAME",
         "text":"HINT_20_TEXT",
         "images":"HINT_20_IMAGES",
         "showDialog":true,
         "preDisplay":null,
         "postDisplay":null
      }];
       
      protected var m_Images:Array = null;
      
      protected var m_ID:int = 0;
      
      protected var m_PostDisplayHook:Function = null;
      
      protected var m_PreDisplayHook:Function = null;
      
      protected var m_ShowDialog:Boolean = false;
      
      protected var m_Name:String = null;
      
      protected var m_Text:String = null;
      
      public function TutorialHint(param1:int)
      {
         super();
         if(!TutorialHint.s_CheckHint(param1))
         {
            throw new ArgumentError("TutorialHint.TutorialHint: Invalid tutorial hint " + param1 + ".");
         }
         var _loc2_:IResourceManager = ResourceManager.getInstance();
         this.m_ID = param1;
         this.m_Name = _loc2_.getString(BUNDLE,TUTORIAL_HINTS[param1].name);
         this.m_Text = _loc2_.getString(BUNDLE,TUTORIAL_HINTS[param1].text);
         this.m_Images = _loc2_.getStringArray(BUNDLE,TUTORIAL_HINTS[param1].images);
         this.m_ShowDialog = TUTORIAL_HINTS[param1].showDialog;
         this.m_PreDisplayHook = TUTORIAL_HINTS[param1].preDisplay;
         this.m_PostDisplayHook = TUTORIAL_HINTS[param1].postDisplay;
         var _loc3_:int = 0;
         var _loc4_:int = this.m_Images != null?int(this.m_Images.length):0;
         while(_loc3_ < _loc4_)
         {
            this.m_Images[_loc3_] = _loc2_.getClass(BUNDLE,this.m_Images[_loc3_]);
            _loc3_++;
         }
      }
      
      public static function s_CheckHint(param1:int) : Boolean
      {
         return param1 > 0 && param1 < TUTORIAL_HINTS.length && TUTORIAL_HINTS[param1] != null;
      }
      
      public function get known() : Boolean
      {
         var _loc1_:OptionsStorage = Tibia.s_GetOptions();
         return _loc1_ != null && Boolean(_loc1_.getKnownTutorialHint(this.m_ID));
      }
      
      public function get name() : String
      {
         return this.m_Name;
      }
      
      public function get ID() : int
      {
         return this.m_ID;
      }
      
      public function perform(param1:Boolean = false) : void
      {
         var _Widget:TutorialHintWidget = null;
         var a_Repeat:Boolean = param1;
         try
         {
            if(this.m_PreDisplayHook != null)
            {
               this.m_PreDisplayHook();
            }
         }
         catch(e:Error)
         {
         }
         if(this.m_Text != null)
         {
            if(this.m_ShowDialog)
            {
               _Widget = new TutorialHintWidget();
               _Widget.text = this.m_Text;
               _Widget.images = this.m_Images;
               _Widget.addEventListener(CloseEvent.CLOSE,this.onDialogClose);
               _Widget.show();
            }
            else
            {
               this.showMessage();
            }
         }
      }
      
      protected function showMessage() : void
      {
         var _loc1_:String = null;
         if(this.m_Text != null)
         {
            _loc1_ = StringHelper.s_StripTags(this.m_Text);
            Tibia.s_GetWorldMapStorage().addOnscreenMessage(null,-1,null,0,MessageMode.MESSAGE_TUTORIAL_HINT,_loc1_);
            Tibia.s_GetChatStorage().addChannelMessage(-1,-1,null,0,MessageMode.MESSAGE_TUTORIAL_HINT,_loc1_);
         }
      }
      
      public function set known(param1:Boolean) : void
      {
         var _loc2_:OptionsStorage = Tibia.s_GetOptions();
         if(_loc2_ != null)
         {
            _loc2_.setKnownTutorialHint(this.m_ID,param1);
         }
      }
      
      protected function onDialogClose(param1:CloseEvent) : void
      {
         var a_Event:CloseEvent = param1;
         var _Widget:TutorialHintWidget = null;
         if(a_Event != null && (_Widget = a_Event.currentTarget as TutorialHintWidget) != null)
         {
            _Widget.removeEventListener(CloseEvent.CLOSE,this.onDialogClose);
            this.showMessage();
            try
            {
               if(this.m_PostDisplayHook != null)
               {
                  this.m_PostDisplayHook();
               }
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
   }
}
