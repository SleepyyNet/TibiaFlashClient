package tibia.appearances
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import tibia.market.MarketWidget;
   import loader.asset.IAssetProvider;
   import flash.events.Event;
   import tibia.appearances.widgetClasses.AsyncCompressedSpriteProvider;
   import tibia.appearances.widgetClasses.AsyncSpriteCache;
   import flash.system.System;
   import flash.events.ErrorEvent;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import shared.utility.StringHelper;
   import shared.utility.Vector3D;
   
   public class AppearanceStorage extends EventDispatcher
   {
      
      private static const ENVIRONMENTAL_EFFECTS:Array = [];
      
      protected static const RENDERER_DEFAULT_HEIGHT:Number = MAP_WIDTH * FIELD_SIZE;
      
      protected static const NUM_EFFECTS:int = 200;
      
      public static const FLAG_LIQUIDPOOL:int = 11;
      
      private static const ACTION_LOOK:int = 6;
      
      public static const FLAG_HOOKEAST:int = 20;
      
      private static const ACTION_TALK:int = 9;
      
      private static const ACTION_SMARTCLICK:int = 100;
      
      protected static const ONSCREEN_MESSAGE_WIDTH:int = 295;
      
      public static const FLAG_UNMOVE:int = 13;
      
      private static const MOUSE_BUTTON_MIDDLE:int = 3;
      
      public static const FLAG_MULTIUSE:int = 7;
      
      public static const FLAG_IGNORELOOK:int = 32;
      
      public static const COMPRESSED_IMAGES_CACHE_MEMORY:uint = 4 * 768 * 768 * 15;
      
      protected static const FIELD_ENTER_NOT_POSSIBLE:uint = 2;
      
      public static const FLAG_USABLE:int = 254;
      
      public static const FLAG_WRITE:int = 8;
      
      public static const FLAG_BANK:int = 0;
      
      private static const MOUSE_BUTTON_RIGHT:int = 2;
      
      protected static const UNDERGROUND_LAYER:int = 2;
      
      protected static const FIELD_HEIGHT:int = 24;
      
      protected static const FIELD_ENTER_POSSIBLE:uint = 0;
      
      public static const FLAG_FORCEUSE:int = 6;
      
      protected static const FIELD_CACHESIZE:int = FIELD_SIZE;
      
      public static const FLAG_LYINGOBJECT:int = 27;
      
      public static const FLAG_CLIP:int = 1;
      
      protected static const FIELD_SIZE:int = 32;
      
      public static const FLAG_DEFAULT_ACTION:int = 35;
      
      protected static const PLAYER_OFFSET_X:int = 8;
      
      protected static const PLAYER_OFFSET_Y:int = 6;
      
      public static const SPRITE_CACHE_PAGE_DIMENSION:uint = 512;
      
      protected static const FIELD_ENTER_POSSIBLE_NO_ANIMATION:uint = 1;
      
      public static const FLAG_ANIMATION:int = 16776961;
      
      public static const FLAG_CONTAINER:int = 4;
      
      public static const FLAG_HOOKSOUTH:int = 19;
      
      protected static const MAP_MAX_X:int = MAP_MIN_X + (1 << 14 - 1);
      
      protected static const MAP_MAX_Y:int = MAP_MIN_Y + (1 << 14 - 1);
      
      public static const FLAG_CLOTHES:int = 33;
      
      public static const FLAG_UNPASS:int = 12;
      
      protected static const ONSCREEN_MESSAGE_HEIGHT:int = 195;
      
      public static const FLAG_LIGHT:int = 22;
      
      public static const FLAG_HANG:int = 18;
      
      protected static const NUM_ONSCREEN_MESSAGES:int = 16;
      
      public static const FLAG_HEIGHT:int = 26;
      
      protected static const MAP_MAX_Z:int = 15;
      
      public static const FLAG_BOTTOM:int = 2;
      
      public static const FLAG_MARKET:int = 34;
      
      public static const FLAG_AUTOMAP:int = 29;
      
      private static const ACTION_ATTACK:int = 1;
      
      protected static const GROUND_LAYER:int = 7;
      
      public static const FLAG_TAKE:int = 17;
      
      public static const FLAG_ANIMATEALWAYS:int = 28;
      
      private static const ACTION_CONTEXT_MENU:int = 5;
      
      public static const SPRITE_CACHE_PAGE_COUNT:uint = 5 * 5;
      
      protected static const MAP_HEIGHT:int = 11;
      
      public static const FLAG_ROTATE:int = 21;
      
      private static const MOUSE_BUTTON_LEFT:int = 1;
      
      public static const FLAG_NOMOVEMENTANIMATION:int = 16;
      
      public static const FLAG_CUMULATIVE:int = 5;
      
      private static const ACTION_NONE:int = 0;
      
      public static const FLAG_WRITEONCE:int = 9;
      
      public static const FLAG_UNSIGHT:int = 14;
      
      public static const FLAG_LENSHELP:int = 30;
      
      private static const ACTION_OPEN:int = 8;
      
      private static const ACTION_AUTOWALK_HIGHLIGHT:int = 4;
      
      public static const FLAG_FULLBANK:int = 31;
      
      private static const ACTION_UNSET:int = -1;
      
      protected static const NUM_FIELDS:int = MAPSIZE_Z * MAPSIZE_Y * MAPSIZE_X;
      
      public static const FLAG_AVOID:int = 15;
      
      protected static const RENDERER_DEFAULT_WIDTH:Number = MAP_WIDTH * FIELD_SIZE;
      
      protected static const MAP_MIN_X:int = 24576;
      
      protected static const MAP_MIN_Y:int = 24576;
      
      public static const FLAG_DONTHIDE:int = 23;
      
      public static const FLAG_SHIFT:int = 25;
      
      protected static const RENDERER_MIN_HEIGHT:Number = Math.round(MAP_HEIGHT * 2 / 3 * FIELD_SIZE);
      
      protected static const MAP_MIN_Z:int = 0;
      
      public static const FLAG_LIQUIDCONTAINER:int = 10;
      
      private static const ACTION_USE_OR_OPEN:int = 101;
      
      protected static const MAPSIZE_X:int = MAP_WIDTH + 3;
      
      protected static const MAPSIZE_Y:int = MAP_HEIGHT + 3;
      
      protected static const MAPSIZE_Z:int = 8;
      
      protected static const MAPSIZE_W:int = 10;
      
      protected static const RENDERER_MIN_WIDTH:Number = Math.round(MAP_WIDTH * 2 / 3 * FIELD_SIZE);
      
      private static const ACTION_AUTOWALK:int = 3;
      
      public static const FLAG_TOP:int = 3;
      
      protected static const MAP_WIDTH:int = 15;
      
      private static const ACTION_USE:int = 7;
      
      public static const FLAG_TRANSLUCENT:int = 24;
      
      private static const MOUSE_BUTTON_BOTH:int = 4;
      
      private static const ACTION_ATTACK_OR_TALK:int = 102;
       
      private var m_OutfitTypes:Vector.<tibia.appearances.AppearanceType>;
      
      private var m_ObjectTypes:Vector.<tibia.appearances.AppearanceType>;
      
      public var m_AsyncSpriteCache:AsyncSpriteCache = null;
      
      private var m_AsyncCompressedSpriteProvider:AsyncCompressedSpriteProvider = null;
      
      private var m_MissileTypes:Vector.<tibia.appearances.AppearanceType>;
      
      private var m_ObjectTypeInfoCache:Vector.<tibia.appearances.AppearanceTypeInfo>;
      
      private var m_MarketObjectTypes:Array;
      
      private var m_SpritesInformation:tibia.appearances.SpritesInformation = null;
      
      private var m_EffectTypes:Vector.<tibia.appearances.AppearanceType>;
      
      public function AppearanceStorage()
      {
         this.m_ObjectTypes = new Vector.<tibia.appearances.AppearanceType>();
         this.m_OutfitTypes = new Vector.<tibia.appearances.AppearanceType>();
         this.m_MissileTypes = new Vector.<tibia.appearances.AppearanceType>();
         this.m_EffectTypes = new Vector.<tibia.appearances.AppearanceType>();
         this.m_MarketObjectTypes = [];
         this.m_ObjectTypeInfoCache = new Vector.<tibia.appearances.AppearanceTypeInfo>();
         super();
      }
      
      private function postprocessAppearances() : Boolean
      {
         var CachedSpriteInformations:Dictionary = null;
         var _Type:tibia.appearances.AppearanceType = null;
         var i:int = 0;
         var j:int = 0;
         _Type = new tibia.appearances.AppearanceType(AppearanceInstance.CREATURE);
         _Type.isAvoid = true;
         _Type.isCachable = false;
         this.m_ObjectTypes[AppearanceInstance.CREATURE] = _Type;
         _Type = this.m_ObjectTypes[AppearanceInstance.PURSE];
         _Type.isUnmoveable = true;
         _Type.isTakeable = false;
         _Type = new tibia.appearances.AppearanceType(OutfitInstance.INVISIBLE_OUTFIT_ID);
         _Type.width = 1;
         _Type.height = 1;
         _Type.displacementX = 8;
         _Type.displacementY = 8;
         _Type.exactSize = FIELD_SIZE;
         _Type.layers = 1;
         _Type.patternWidth = 4;
         _Type.patternHeight = 1;
         _Type.patternDepth = 1;
         _Type.phases = 3;
         _Type.numSprites = _Type.phases * _Type.patternWidth;
         _Type.isDisplaced = true;
         _Type.isAnimateAlways = true;
         _Type.isAnimation = true;
         _Type.isCachable = false;
         var Durations:Vector.<FrameDuration> = new Vector.<FrameDuration>();
         i = 0;
         while(i < _Type.phases)
         {
            Durations.push(new FrameDuration(300,300));
            i++;
         }
         _Type.animator = new AppearanceAnimator(_Type.phases,0,0,AppearanceAnimator.ANIMATION_SYNCHRON,Durations);
         if(this.m_EffectTypes[13].spriteIDs.length > 1)
         {
            i = 0;
            while(i < 3)
            {
               j = 0;
               while(j < 4)
               {
                  _Type.spriteIDs[i * 4 + j] = this.m_EffectTypes[13].spriteIDs[i + 1];
                  j++;
               }
               i++;
            }
            this.m_OutfitTypes[OutfitInstance.INVISIBLE_OUTFIT_ID] = _Type;
         }
         _Type = new tibia.appearances.AppearanceType(MarketWidget.REQUEST_OWN_OFFERS);
         _Type.marketCategory = -1;
         _Type.marketShowAs = -1;
         _Type.marketTradeAs = MarketWidget.REQUEST_OWN_OFFERS;
         this.m_MarketObjectTypes.push(_Type);
         _Type = new tibia.appearances.AppearanceType(MarketWidget.REQUEST_OWN_HISTORY);
         _Type.marketCategory = -1;
         _Type.marketShowAs = -1;
         _Type.marketTradeAs = MarketWidget.REQUEST_OWN_HISTORY;
         this.m_MarketObjectTypes.push(_Type);
         this.m_MarketObjectTypes.sortOn("marketTradeAs",Array.NUMERIC);
         CachedSpriteInformations = this.m_SpritesInformation.cachedSpriteInformations;
         var UpdateAppearanceTypes:Function = function(param1:AppearanceType, param2:int, param3:Vector.<AppearanceType>):void
         {
            var _loc4_:uint = 0;
            var _loc5_:uint = 0;
            if(param1 != null)
            {
               if(this == m_OutfitTypes && param1.layers == 2)
               {
                  param1.spriteProvider = m_AsyncCompressedSpriteProvider;
               }
               else
               {
                  param1.spriteProvider = m_AsyncSpriteCache;
               }
               _loc4_ = 0;
               while(_loc4_ < param1.spriteIDs.length)
               {
                  param1.cachedSpriteInformations[_loc4_] = CachedSpriteInformations[param1.spriteIDs[_loc4_]];
                  _loc5_ = m_SpritesInformation.getFirstSpriteID(param1.spriteIDs[_loc4_]);
                  if(param1.spritesheetIDs.indexOf(_loc5_) < 0)
                  {
                     param1.spritesheetIDs.push(_loc5_);
                  }
                  _loc4_++;
               }
            }
         };
         this.m_ObjectTypes.forEach(UpdateAppearanceTypes);
         this.m_OutfitTypes.forEach(UpdateAppearanceTypes,this.m_OutfitTypes);
         this.m_EffectTypes.forEach(UpdateAppearanceTypes);
         this.m_MissileTypes.forEach(UpdateAppearanceTypes);
         return true;
      }
      
      public function setAssetProvider(param1:IAssetProvider) : void
      {
         var _loc4_:Event = null;
         if(param1 == null)
         {
            throw new ArgumentError("AppearanceStorage.setAssetProvider: asset provider must not be null");
         }
         var _loc2_:Boolean = false;
         this.m_SpritesInformation = new tibia.appearances.SpritesInformation(param1.getSpriteAssets());
         this.m_AsyncCompressedSpriteProvider = new AsyncCompressedSpriteProvider(param1,this.m_SpritesInformation,COMPRESSED_IMAGES_CACHE_MEMORY);
         this.m_AsyncSpriteCache = new AsyncSpriteCache(this.m_AsyncCompressedSpriteProvider,this.m_SpritesInformation.cachedSpriteInformations);
         var _loc3_:AppearancesAsset = param1.getAppearances();
         _loc2_ = _loc3_ == null || !this.loadAppearances(_loc3_.rawBytes);
         if(this.postprocessAppearances())
         {
            param1.removeAsset(_loc3_);
            System.pauseForGCIfCollectionImminent(0.25);
            _loc4_ = new Event(Event.COMPLETE);
            dispatchEvent(_loc4_);
         }
         else
         {
            this.loadError();
         }
         if(_loc2_)
         {
            this.loadError();
         }
      }
      
      private function loadError() : void
      {
         this.reset();
         var _loc1_:ErrorEvent = new ErrorEvent(ErrorEvent.ERROR);
         dispatchEvent(_loc1_);
      }
      
      private function loadAppearances(param1:ByteArray) : Boolean
      {
         if(param1 == null || param1.bytesAvailable < 12)
         {
            return false;
         }
         var _loc2_:String = param1.endian;
         param1.endian = Endian.LITTLE_ENDIAN;
         this.m_ObjectTypes.length = param1.readUnsignedShort() + 1;
         this.m_OutfitTypes.length = param1.readUnsignedShort() + 1;
         this.m_EffectTypes.length = param1.readUnsignedShort() + 1;
         this.m_MissileTypes.length = param1.readUnsignedShort() + 1;
         var _loc3_:Boolean = true;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = AppearanceInstance.CREATURE + 1;
         _loc5_ = this.m_ObjectTypes.length;
         while(Boolean(_loc3_) && _loc4_ < _loc5_)
         {
            _loc3_ = this.readAppearanceType(param1,this.m_ObjectTypes,_loc4_);
            _loc4_++;
         }
         _loc4_ = 1;
         _loc5_ = this.m_OutfitTypes.length;
         while(Boolean(_loc3_) && _loc4_ < _loc5_)
         {
            _loc3_ = this.readAppearanceType(param1,this.m_OutfitTypes,_loc4_);
            _loc4_++;
         }
         _loc4_ = 1;
         _loc5_ = this.m_EffectTypes.length;
         while(Boolean(_loc3_) && _loc4_ < _loc5_)
         {
            _loc3_ = this.readAppearanceType(param1,this.m_EffectTypes,_loc4_);
            _loc4_++;
         }
         _loc4_ = 1;
         _loc5_ = this.m_MissileTypes.length;
         while(Boolean(_loc3_) && _loc4_ < _loc5_)
         {
            _loc3_ = this.readAppearanceType(param1,this.m_MissileTypes,_loc4_);
            _loc4_++;
         }
         _loc3_ = Boolean(_loc3_) && param1.bytesAvailable == 0;
         param1.endian = _loc2_;
         return _loc3_;
      }
      
      public function getObjectType(param1:int) : tibia.appearances.AppearanceType
      {
         if(param1 >= AppearanceInstance.CREATURE && param1 < this.m_ObjectTypes.length)
         {
            return this.m_ObjectTypes[param1];
         }
         return null;
      }
      
      private function setTypeInfo(param1:Vector.<tibia.appearances.AppearanceTypeInfo>, param2:int, param3:int, param4:String) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = param1.length - 1;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = -1;
         while(_loc5_ <= _loc6_)
         {
            _loc7_ = (_loc5_ + _loc6_) / 2;
            _loc8_ = AppearanceTypeRef.s_CompareExternal(param1[_loc7_],param2,param3);
            if(_loc8_ < 0)
            {
               _loc5_ = _loc7_ + 1;
               continue;
            }
            if(_loc8_ > 0)
            {
               _loc6_ = _loc7_ - 1;
               continue;
            }
            _loc9_ = _loc7_;
            break;
         }
         if(_loc9_ < 0)
         {
            param1.splice(_loc5_,0,new tibia.appearances.AppearanceTypeInfo(param2,param3,param4));
         }
         else
         {
            param1[_loc9_].name = param4;
         }
      }
      
      public function getOutfitType(param1:int) : tibia.appearances.AppearanceType
      {
         if(param1 >= 1 && param1 < this.m_OutfitTypes.length)
         {
            return this.m_OutfitTypes[param1];
         }
         return null;
      }
      
      public function createOutfitInstance(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : OutfitInstance
      {
         if(param1 >= 1 && param1 < this.m_OutfitTypes.length || param1 == OutfitInstance.INVISIBLE_OUTFIT_ID)
         {
            return new OutfitInstance(param1,this.m_OutfitTypes[param1],param2,param3,param4,param5,param6);
         }
         return null;
      }
      
      public function reset() : void
      {
         this.m_ObjectTypes.length = 0;
         this.m_OutfitTypes.length = 0;
         this.m_MissileTypes.length = 0;
         this.m_EffectTypes.length = 0;
         this.m_MarketObjectTypes.length = 0;
         this.m_ObjectTypeInfoCache.length = 0;
      }
      
      public function createTextualEffectInstance(param1:int, param2:int, param3:Number) : TextualEffectInstance
      {
         return new TextualEffectInstance(param1,null,param2,param3);
      }
      
      public function get marketObjectTypes() : Array
      {
         return this.m_MarketObjectTypes;
      }
      
      public function createObjectInstance(param1:int, param2:int) : ObjectInstance
      {
         if(param1 >= AppearanceInstance.CREATURE && param1 < this.m_ObjectTypes.length)
         {
            return new ObjectInstance(param1,this.m_ObjectTypes[param1],param2);
         }
         return null;
      }
      
      public function createEffectInstance(param1:int) : EffectInstance
      {
         if(param1 >= 1 && param1 < this.m_EffectTypes.length)
         {
            return new EffectInstance(param1,this.m_EffectTypes[param1]);
         }
         return null;
      }
      
      public function setCachedObjectTypeName(param1:int, param2:int, param3:String) : void
      {
         if(param3 == null || param3.length < 1)
         {
            throw new ArgumentError("AppearanceStorage.setCachedObjectTypeName: Invalid name.");
         }
         this.setTypeInfo(this.m_ObjectTypeInfoCache,param1,param2,param3);
      }
      
      public function getMarketObjectType(param1:*) : tibia.appearances.AppearanceType
      {
         var _loc6_:tibia.appearances.AppearanceType = null;
         var _loc2_:int = -1;
         if(param1 is tibia.appearances.AppearanceType && Boolean(AppearanceType(param1).isMarket))
         {
            _loc2_ = AppearanceType(param1).marketTradeAs;
         }
         else
         {
            _loc2_ = int(param1);
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = this.m_MarketObjectTypes.length - 1;
         while(_loc4_ <= _loc5_)
         {
            _loc3_ = _loc4_ + _loc5_ >>> 1;
            _loc6_ = AppearanceType(this.m_MarketObjectTypes[_loc3_]);
            if(_loc6_.marketTradeAs == _loc2_)
            {
               return _loc6_;
            }
            if(_loc6_.marketTradeAs < _loc2_)
            {
               _loc4_ = _loc3_ + 1;
            }
            else
            {
               _loc5_ = _loc3_ - 1;
            }
         }
         return null;
      }
      
      private function onLoaderError(param1:Event) : void
      {
         this.loadError();
      }
      
      public function hasOutfitType(param1:int) : Boolean
      {
         return param1 >= 1 && param1 < this.m_OutfitTypes.length;
      }
      
      private function readAppearanceType(param1:ByteArray, param2:Vector.<tibia.appearances.AppearanceType>, param3:int, param4:int = 0) : Boolean
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Vector.<FrameDuration> = null;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:FrameDuration = null;
         var _loc16_:int = 0;
         if(param1 == null || param1.bytesAvailable < 11)
         {
            return false;
         }
         var _loc5_:tibia.appearances.AppearanceType = new tibia.appearances.AppearanceType(param3);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         loop0:
         while(true)
         {
            if(_loc6_ >= 255)
            {
               _loc5_.width = param1.readUnsignedByte();
               _loc5_.height = param1.readUnsignedByte();
               if(_loc5_.width > 1 || _loc5_.height > 1)
               {
                  _loc5_.exactSize = param1.readUnsignedByte();
               }
               else
               {
                  _loc5_.exactSize = FIELD_SIZE;
               }
               _loc5_.layers = param1.readUnsignedByte();
               _loc5_.patternWidth = param1.readUnsignedByte();
               _loc5_.patternHeight = param1.readUnsignedByte();
               _loc5_.patternDepth = param1.readUnsignedByte();
               _loc5_.phases = param1.readUnsignedByte();
               if(_loc5_.phases > 1)
               {
                  _loc5_.isAnimation = true;
                  _loc9_ = param1.readUnsignedByte();
                  _loc10_ = param1.readInt();
                  _loc11_ = param1.readByte();
                  _loc12_ = new Vector.<FrameDuration>();
                  _loc7_ = 0;
                  while(_loc7_ < _loc5_.phases)
                  {
                     _loc13_ = param1.readUnsignedInt();
                     _loc14_ = param1.readUnsignedInt();
                     _loc15_ = new FrameDuration(_loc13_,_loc14_);
                     _loc12_.push(_loc15_);
                     _loc7_++;
                  }
                  _loc5_.animator = new AppearanceAnimator(_loc5_.phases,_loc11_,_loc10_,_loc9_,_loc12_);
               }
               _loc5_.numSprites = _loc5_.layers * _loc5_.patternWidth * _loc5_.patternHeight * _loc5_.patternDepth * _loc5_.phases;
               _loc7_ = 0;
               while(_loc7_ < _loc5_.numSprites)
               {
                  _loc5_.spriteIDs[_loc7_] = param1.readUnsignedInt();
                  _loc7_++;
               }
               _loc5_.isCachable = !_loc5_.isAnimation && !_loc5_.isHangable && !_loc5_.isLight && _loc5_.exactSize + Math.max(_loc5_.displacementX,_loc5_.displacementY) <= FIELD_CACHESIZE;
               param2[param3] = _loc5_;
               if(_loc5_.isMarket)
               {
                  _loc16_ = -1;
                  _loc16_ = this.m_MarketObjectTypes.length - 1;
                  while(_loc16_ >= 0)
                  {
                     if(_loc5_.marketTradeAs == AppearanceType(this.m_MarketObjectTypes[_loc16_]).marketTradeAs)
                     {
                        break;
                     }
                     _loc16_--;
                  }
                  if(_loc16_ < 0)
                  {
                     this.m_MarketObjectTypes.push(_loc5_);
                  }
               }
               return true;
            }
            _loc6_ = param1.readUnsignedByte();
            switch(_loc6_)
            {
               case FLAG_BANK:
                  _loc5_.isBank = true;
                  _loc5_.waypoints = param1.readUnsignedShort();
                  continue;
               case FLAG_CLIP:
                  _loc5_.isClip = true;
                  continue;
               case FLAG_BOTTOM:
                  _loc5_.isBottom = true;
                  continue;
               case FLAG_TOP:
                  _loc5_.isTop = true;
                  continue;
               case FLAG_CONTAINER:
                  _loc5_.isContainer = true;
                  continue;
               case FLAG_CUMULATIVE:
                  _loc5_.isCumulative = true;
                  continue;
               case FLAG_USABLE:
                  _loc5_.isUsable = true;
                  continue;
               case FLAG_FORCEUSE:
                  _loc5_.isForceUse = true;
                  continue;
               case FLAG_MULTIUSE:
                  _loc5_.isMultiUse = true;
                  continue;
               case FLAG_WRITE:
                  _loc5_.isWriteable = true;
                  _loc5_.maxTextLength = param1.readUnsignedShort();
                  continue;
               case FLAG_WRITEONCE:
                  _loc5_.isWriteableOnce = true;
                  _loc5_.maxTextLength = param1.readUnsignedShort();
                  continue;
               case FLAG_LIQUIDCONTAINER:
                  _loc5_.isLiquidContainer = true;
                  continue;
               case FLAG_LIQUIDPOOL:
                  _loc5_.isLiquidPool = true;
                  continue;
               case FLAG_UNPASS:
                  _loc5_.isUnpassable = true;
                  continue;
               case FLAG_UNMOVE:
                  _loc5_.isUnmoveable = true;
                  continue;
               case FLAG_UNSIGHT:
                  _loc5_.isUnsight = true;
                  continue;
               case FLAG_AVOID:
                  _loc5_.isAvoid = true;
                  continue;
               case FLAG_NOMOVEMENTANIMATION:
                  _loc5_.preventMovementAnimation = true;
                  continue;
               case FLAG_TAKE:
                  _loc5_.isTakeable = true;
                  continue;
               case FLAG_HANG:
                  _loc5_.isHangable = true;
                  continue;
               case FLAG_HOOKSOUTH:
                  _loc5_.isHookSouth = true;
                  continue;
               case FLAG_HOOKEAST:
                  _loc5_.isHookEast = true;
                  continue;
               case FLAG_ROTATE:
                  _loc5_.isRotateable = true;
                  continue;
               case FLAG_LIGHT:
                  _loc5_.isLight = true;
                  _loc5_.brightness = param1.readUnsignedShort();
                  _loc5_.lightColour = param1.readUnsignedShort();
                  continue;
               case FLAG_DONTHIDE:
                  _loc5_.isDonthide = true;
                  continue;
               case FLAG_TRANSLUCENT:
                  _loc5_.isTranslucent = true;
                  continue;
               case FLAG_SHIFT:
                  _loc5_.isDisplaced = true;
                  _loc5_.displacementX = param1.readUnsignedShort();
                  _loc5_.displacementY = param1.readUnsignedShort();
                  continue;
               case FLAG_HEIGHT:
                  _loc5_.isHeight = true;
                  _loc5_.elevation = param1.readUnsignedShort();
                  continue;
               case FLAG_LYINGOBJECT:
                  _loc5_.isLyingObject = true;
                  continue;
               case FLAG_ANIMATEALWAYS:
                  _loc5_.isAnimateAlways = true;
                  continue;
               case FLAG_AUTOMAP:
                  _loc5_.isAutomap = true;
                  _loc5_.automapColour = param1.readUnsignedShort();
                  continue;
               case FLAG_LENSHELP:
                  _loc5_.isLensHelp = true;
                  _loc5_.lensHelp = param1.readUnsignedShort();
                  continue;
               case FLAG_FULLBANK:
                  _loc5_.isFullBank = true;
                  continue;
               case FLAG_IGNORELOOK:
                  _loc5_.isIgnoreLook = true;
                  continue;
               case FLAG_CLOTHES:
                  _loc5_.isCloth = true;
                  _loc5_.clothSlot = param1.readUnsignedShort();
                  continue;
               case FLAG_DEFAULT_ACTION:
                  _loc5_.isDefaultAction = true;
                  _loc8_ = param1.readUnsignedShort();
                  switch(_loc8_)
                  {
                     case 0:
                        _loc5_.defaultAction = ACTION_NONE;
                        break;
                     case 1:
                        _loc5_.defaultAction = ACTION_LOOK;
                        break;
                     case 2:
                        _loc5_.defaultAction = ACTION_USE;
                        break;
                     case 3:
                        _loc5_.defaultAction = ACTION_OPEN;
                        break;
                     case 4:
                        _loc5_.defaultAction = ACTION_AUTOWALK_HIGHLIGHT;
                  }
                  continue;
               case FLAG_MARKET:
                  _loc5_.isMarket = true;
                  _loc5_.marketCategory = param1.readUnsignedShort();
                  if(!MarketWidget.isValidCategoryID(_loc5_.marketCategory))
                  {
                     throw new Error("AppearanceStorage.readAppearanceType: Invalid market category  " + _loc5_.marketCategory + ".");
                  }
                  _loc5_.marketTradeAs = param1.readUnsignedShort();
                  _loc5_.marketShowAs = param1.readUnsignedShort();
                  _loc5_.marketName = StringHelper.s_ReadLongStringFromByteArray(param1,MarketWidget.DETAIL_NAME_LENGTH);
                  _loc5_.marketNameLowerCase = _loc5_.marketName.toLowerCase();
                  _loc5_.marketRestrictProfession = param1.readUnsignedShort();
                  _loc5_.marketRestrictLevel = param1.readUnsignedShort();
                  continue;
               case 255:
                  continue;
               default:
                  break loop0;
            }
         }
         throw new Error("AppearanceStorage.readAppearanceType: Invalid flag: " + _loc6_ + ".");
      }
      
      public function createEnvironmentalEffect(param1:int) : ObjectInstance
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = ENVIRONMENTAL_EFFECTS.length - 1;
         var _loc4_:int = 0;
         while(_loc2_ <= _loc3_)
         {
            _loc4_ = (_loc2_ + _loc3_) / 2;
            _loc5_ = ENVIRONMENTAL_EFFECTS[_loc4_];
            if(_loc5_.ID < param1)
            {
               _loc2_ = _loc4_ + 1;
               continue;
            }
            if(_loc5_.ID > param1)
            {
               _loc3_ = _loc4_ - _loc4_;
               continue;
            }
            _loc6_ = _loc5_.appearanceType;
            _loc7_ = !!_loc5_.atmospheric?1:0;
            return new ObjectInstance(_loc6_,this.m_ObjectTypes[_loc6_],_loc7_);
         }
         return null;
      }
      
      public function getCachedObjectTypeName(param1:int, param2:int) : String
      {
         var _loc3_:tibia.appearances.AppearanceTypeInfo = this.getTypeInfo(this.m_ObjectTypeInfoCache,param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.name;
         }
         return null;
      }
      
      private function getTypeInfo(param1:Vector.<tibia.appearances.AppearanceTypeInfo>, param2:int, param3:int) : tibia.appearances.AppearanceTypeInfo
      {
         var _loc4_:int = 0;
         var _loc5_:int = param1.length - 1;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc4_ <= _loc5_)
         {
            _loc6_ = (_loc4_ + _loc5_) / 2;
            _loc7_ = AppearanceTypeRef.s_CompareExternal(param1[_loc6_],param2,param3);
            if(_loc7_ < 0)
            {
               _loc4_ = _loc6_ + 1;
               continue;
            }
            if(_loc7_ > 0)
            {
               _loc5_ = _loc6_ - 1;
               continue;
            }
            return param1[_loc6_];
         }
         return null;
      }
      
      public function createMissileInstance(param1:uint, param2:Vector3D, param3:Vector3D) : MissileInstance
      {
         if(param1 >= 1 && param1 < this.m_MissileTypes.length)
         {
            return new MissileInstance(param1,this.m_MissileTypes[param1],param2,param3);
         }
         return null;
      }
   }
}
