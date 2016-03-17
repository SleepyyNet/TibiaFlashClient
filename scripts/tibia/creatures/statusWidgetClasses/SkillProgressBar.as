package tibia.creatures.statusWidgetClasses
{
   import mx.containers.HBox;
   import shared.utility.cacheStyleInstance;
   import tibia.creatures.Player;
   import flash.display.DisplayObject;
   import mx.events.ToolTipEvent;
   import mx.core.IToolTip;
   import tibia.creatures.StatusWidget;
   import mx.core.IInvalidating;
   import mx.events.PropertyChangeEvent;
   import shared.controls.ShapeWrapper;
   
   public class SkillProgressBar extends HBox
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const STATE_NONE:int = -1;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const WAR_NONE:int = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const SKILL_FISHING:int = 13;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const SKILL_OFFLINETRAINING:int = 17;
      
      private static const BUNDLE:String = "StatusWidget";
      
      private static const SKILL_OPTIONS:Array = [{
         "value":SKILL_CARRYSTRENGTH,
         "styleProp":null
      },{
         "value":SKILL_EXPERIENCE,
         "styleProp":null
      },{
         "value":SKILL_FED,
         "styleProp":null
      },{
         "value":SKILL_FIGHTAXE,
         "styleProp":"iconSkillFightAxe"
      },{
         "value":SKILL_FIGHTCLUB,
         "styleProp":"iconSkillFightClub"
      },{
         "value":SKILL_FIGHTDISTANCE,
         "styleProp":"iconSkillFightDistance"
      },{
         "value":SKILL_FIGHTFIST,
         "styleProp":"iconSkillFightFist"
      },{
         "value":SKILL_FIGHTSHIELD,
         "styleProp":"iconSkillFightShield"
      },{
         "value":SKILL_FIGHTSWORD,
         "styleProp":"iconSkillFightSword"
      },{
         "value":SKILL_FISHING,
         "styleProp":"iconSkillFishing"
      },{
         "value":SKILL_GOSTRENGTH,
         "styleProp":null
      },{
         "value":SKILL_HITPOINTS,
         "styleProp":null
      },{
         "value":SKILL_LEVEL,
         "styleProp":"iconSkillLevel"
      },{
         "value":SKILL_MAGLEVEL,
         "styleProp":"iconSkillMagLevel"
      },{
         "value":SKILL_MANA,
         "styleProp":null
      },{
         "value":SKILL_NONE,
         "styleProp":null
      },{
         "value":SKILL_OFFLINETRAINING,
         "styleProp":null
      },{
         "value":SKILL_SOULPOINTS,
         "styleProp":null
      },{
         "value":SKILL_STAMINA,
         "styleProp":null
      }];
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
      
      {
         cacheStyleInstance(SKILL_OPTIONS,".statusWidgetIcons");
      }
      
      private var m_UncommittedSkill:Boolean = true;
      
      private var m_Skill:int = -1;
      
      private var m_UIProgress:tibia.creatures.statusWidgetClasses.BitmapProgressBar = null;
      
      private var m_Character:Player = null;
      
      private var m_UncommittedCharacter:Boolean = false;
      
      private var m_UIIcon:ShapeWrapper = null;
      
      public function SkillProgressBar()
      {
         super();
         toolTip = "toolTip";
         addEventListener(ToolTipEvent.TOOL_TIP_SHOW,this.onToolTip);
      }
      
      public function set skill(param1:int) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = SKILL_NONE;
         for each(_loc3_ in SKILL_OPTIONS)
         {
            if(_loc3_.value === param1 && _loc3_.styleProp != null)
            {
               _loc2_ = param1;
               break;
            }
         }
         if(this.m_Skill != _loc2_)
         {
            this.m_Skill = _loc2_;
            this.m_UncommittedSkill = true;
            invalidateProperties();
         }
      }
      
      public function set progressDirection(param1:String) : void
      {
         if(this.m_UIProgress != null)
         {
            this.m_UIProgress.direction = param1;
         }
      }
      
      public function get character() : Player
      {
         return this.m_Character;
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Object = null;
         var _loc2_:* = false;
         super.commitProperties();
         if(this.m_UncommittedCharacter)
         {
            if(this.character != null)
            {
               this.m_UIProgress.value = this.character.getSkillProgress(this.skill);
            }
            this.m_UncommittedCharacter = false;
         }
         if(this.m_UncommittedSkill)
         {
            this.m_UIIcon.removeChildren();
            for each(_loc1_ in SKILL_OPTIONS)
            {
               if(_loc1_.value === this.skill && _loc1_.styleInstance is DisplayObject)
               {
                  this.m_UIIcon.addChild(_loc1_.styleInstance);
                  break;
               }
            }
            if(this.character != null)
            {
               this.m_UIProgress.value = this.character.getSkillProgress(this.skill);
            }
            _loc2_ = this.skill != SKILL_NONE;
            includeInLayout = _loc2_;
            visible = _loc2_;
            this.m_UncommittedSkill = false;
         }
      }
      
      private function onToolTip(param1:ToolTipEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:IToolTip = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(this.skill != SKILL_NONE && this.character != null)
         {
            _loc2_ = NaN;
            _loc3_ = NaN;
            _loc4_ = NaN;
            _loc5_ = null;
            _loc6_ = StatusWidget.s_GetSkillName(this.skill);
            _loc2_ = this.character.getSkillValue(this.skill);
            if(this.skill == SKILL_LEVEL)
            {
               _loc3_ = this.character.getSkillGain(SKILL_EXPERIENCE);
               _loc4_ = Player.s_GetExperienceForLevel(this.character.level + 1) - this.character.getSkillValue(SKILL_EXPERIENCE);
               _loc5_ = resourceManager.getString(BUNDLE,"TIP_SKILL_UNIT_EXPERIENCE");
            }
            else
            {
               _loc3_ = this.character.getSkillGain(this.skill);
               _loc4_ = 100 - this.character.getSkillProgress(this.skill);
               _loc5_ = resourceManager.getString(BUNDLE,"TIP_SKILL_UNIT_DEFAULT");
            }
            _loc4_ = Math.max(0,_loc4_);
            _loc7_ = param1.toolTip;
            if(_loc3_ > 0)
            {
               _loc8_ = Math.floor(_loc4_ * 60 / _loc3_);
               _loc9_ = Math.floor(_loc8_ / 60);
               _loc8_ = _loc8_ - _loc9_ * 60;
               _loc7_.text = resourceManager.getString(BUNDLE,"TIP_SKILL_TEXT_EXTENDED",[_loc6_,_loc2_,_loc4_,_loc5_,_loc3_,_loc9_,_loc8_]);
            }
            else
            {
               _loc7_.text = resourceManager.getString(BUNDLE,"TIP_SKILL_TEXT_SIMPLE",[_loc6_,_loc2_,_loc4_,_loc5_]);
            }
            if(_loc7_ is IInvalidating)
            {
               IInvalidating(_loc7_).validateNow();
               _loc10_ = _loc7_.getExplicitOrMeasuredWidth();
               _loc11_ = _loc7_.getExplicitOrMeasuredHeight();
               _loc12_ = Math.max(0,Math.min(_loc7_.x,stage.stageWidth - _loc10_));
               _loc13_ = Math.max(0,Math.min(_loc7_.y,stage.stageHeight - _loc11_));
               _loc7_.move(_loc12_,_loc13_);
               _loc7_.setActualSize(_loc10_,_loc11_);
            }
         }
         else
         {
            param1.preventDefault();
            param1.stopImmediatePropagation();
         }
      }
      
      override public function set styleName(param1:Object) : void
      {
         super.styleName = param1;
         if(this.m_UIIcon != null)
         {
            this.m_UIIcon.styleName = getStyle("iconStyleName");
         }
         if(this.m_UIProgress != null)
         {
            this.m_UIProgress.styleName = getStyle("progressBarStyleName");
         }
      }
      
      public function get skill() : int
      {
         return this.m_Skill;
      }
      
      public function set character(param1:Player) : void
      {
         if(this.m_Character != param1)
         {
            if(this.m_Character != null)
            {
               this.m_Character.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onCharacterChange);
            }
            this.m_Character = param1;
            this.m_UncommittedCharacter = true;
            invalidateProperties();
            if(this.m_Character != null)
            {
               this.m_Character.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onCharacterChange);
            }
         }
      }
      
      public function get progressDirection() : String
      {
         return this.m_UIProgress != null?this.m_UIProgress.direction:null;
      }
      
      private function onCharacterChange(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "skill" || param1.property == "*")
         {
            this.m_UIProgress.value = this.character.getSkillProgress(this.skill);
         }
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.m_UIIcon = new ShapeWrapper();
         this.m_UIIcon.styleName = getStyle("iconStyleName");
         addChild(this.m_UIIcon);
         this.m_UIProgress = new tibia.creatures.statusWidgetClasses.BitmapProgressBar();
         this.m_UIProgress.labelEnabled = false;
         this.m_UIProgress.labelFormat = "{1}%";
         this.m_UIProgress.percentWidth = 100;
         this.m_UIProgress.styleName = getStyle("progressBarStyleName");
         this.m_UIProgress.tickValues = [25,50,75];
         addChild(this.m_UIProgress);
      }
   }
}
