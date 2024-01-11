<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-31d1-bf57-53ea-ad55" name="Warhammer The Old World" battleScribeVersion="2.03" revision="22" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema" library="true" authorName="Flammy" authorContact="Discord: vflam" authorUrl="www.newrecruit.eu">
  <categoryEntries>
    <categoryEntry name="Characters" hidden="false" id="a4cc-15c9-cfae-1b3b"/>
    <categoryEntry id="f0e3-2e32-8866-ea32" name="Core"/>
    <categoryEntry name="Special" hidden="false" id="633f-f67a-1b6a-d203"/>
    <categoryEntry name="Rare" hidden="false" id="2bfe-5863-46fe-d284"/>
    <categoryEntry name="Mercenaries" hidden="false" id="5b84-2c3c-869d-3522"/>
    <categoryEntry name="CHAMPION" hidden="true" id="83a1-945c-564c-84af"/>
    <categoryEntry name="Regular Infantry" hidden="false" id="f3f7-ca43-674e-115f"/>
    <categoryEntry name="Cavalry" hidden="false" id="36e4-45e0-c904-55d1"/>
    <categoryEntry name="War Machine" hidden="false" id="9fcf-19ad-fe84-9c61"/>
    <categoryEntry name="50PTSLIMIT" hidden="true" id="db34-5941-b4e0-4ca2"/>
    <categoryEntry name="Configuration" hidden="false" id="48b5-1583-6fa3-acda"/>
    <categoryEntry name="Heavy infantry" hidden="false" id="ca7e-d004-ccde-caf3"/>
  </categoryEntries>
  <forceEntries>
    <forceEntry id="8214-cf48-b1cd-5f5e" name="Standard">
      <categoryLinks>
        <categoryLink id="ab07-e23d-ab54-8822" targetId="f0e3-2e32-8866-ea32" name="Core" type="category">
          <constraints>
            <constraint id="d66d-a221-5af9-c648" type="min" value="25" percentValue="true" field="limit::points" scope="roster" includeChildSelections="true"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Rare" hidden="false" id="e603-b373-46b1-4237" targetId="2bfe-5863-46fe-d284" type="category"/>
        <categoryLink name="Cavalry" hidden="false" id="d59f-8eb0-78c4-68c1" targetId="36e4-45e0-c904-55d1" type="category"/>
        <categoryLink name="Configuration" hidden="false" id="aed4-542f-e6ec-d809" targetId="48b5-1583-6fa3-acda" type="category"/>
        <categoryLink name="Special" hidden="false" id="c64f-52a4-9d57-2c86" targetId="633f-f67a-1b6a-d203" type="category"/>
      </categoryLinks>
    </forceEntry>
  </forceEntries>
  <costTypes>
    <costType id="points" name="pts" defaultCostLimit="2000"/>
  </costTypes>
  <profileTypes>
    <profileType name="Unit" hidden="false" id="2878-9a1f-dd74-48e3">
      <characteristicTypes>
        <characteristicType id="5d94-6b94-bd89-1944" name="Troop Type"/>
        <characteristicType id="80a1-bb6f-66e4-4a5b" name="Unit Size"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Model" hidden="false" id="b070-143a-73f-2772">
      <characteristicTypes>
        <characteristicType id="cd3b-a5a4-e185-5a9d" name="M"/>
        <characteristicType id="b007-7d58-4f14-1e01" name="WS"/>
        <characteristicType id="59f9-ccf5-1155-fb05" name="BS"/>
        <characteristicType id="5b6b-1427-2a45-dd0c" name="S"/>
        <characteristicType id="ab43-8b61-83e7-d090" name="T"/>
        <characteristicType id="83ed-7b82-bf1f-e558" name="W"/>
        <characteristicType id="73b1-abe5-72f8-41e2" name="I"/>
        <characteristicType id="dddc-9fbd-b0fd-a480" name="A"/>
        <characteristicType id="c435-6b14-f77e-3c72" name="Ld"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Base" hidden="false" id="1ae4-7f34-4055-fd5f">
      <characteristicTypes>
        <characteristicType id="1adf-d238-57ca-2226" name="Base Size"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Weapon" hidden="false" id="cc88-6a7d-41c9-d63e">
      <characteristicTypes>
        <characteristicType id="47f2-ecee-cae0-9ef9" name="Weapon"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Special Rule" hidden="false" id="c1ac-c1c8-f9d5-9673">
      <characteristicTypes>
        <characteristicType id="9f84-4221-785a-db50" name="Special Rule"/>
        <characteristicType id="fe1a-e33f-651a-9cb8" name="Parameter"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Armour" hidden="false" id="c14f-740-8107-d34b">
      <characteristicTypes>
        <characteristicType id="adcd-c649-e6fc-a9f6" name="Armour"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Banner Enchants" hidden="false" id="60d4-a840-4aac-114c">
      <characteristicTypes>
        <characteristicType id="968d-b32a-6bdb-a394" name="Banner Enchant"/>
      </characteristicTypes>
    </profileType>
  </profileTypes>
  <sharedProfiles>
    <profile name="Base (30x60)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="3a8b-1dd5-77fb-fdc3">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">30x60</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (25x25)" hidden="false" id="193c-4d0d-de6b-bbb1" typeId="1ae4-7f34-4055-fd5f" typeName="Base">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">25x25</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (30x30)" hidden="false" id="7f1f-eba6-b670-ece0" typeId="1ae4-7f34-4055-fd5f" typeName="Base">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">30x30</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Hand Weapon" hidden="false" id="ef45-edcd-18bf-fe1d" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Description of hand weapon....</characteristic>
      </characteristics>
    </profile>
    <profile name="Shield" hidden="false" id="8997-c74d-3a8d-ecf9" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Armour" typeId="adcd-c649-e6fc-a9f6">+1 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Great Weapon" hidden="false" id="88e3-38f0-92d5-b616" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">+2S</characteristic>
      </characteristics>
    </profile>
    <profile name="Lance" hidden="false" id="c84c-99b6-75eb-4f40" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">+2S when charging</characteristic>
      </characteristics>
    </profile>
    <profile name="Heavy Armour" hidden="false" id="c56e-8d1b-bb4-de99" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Armour" typeId="adcd-c649-e6fc-a9f6">+2 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Barding" hidden="false" id="eb5d-bd8a-c75c-66d7" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Armour" typeId="adcd-c649-e6fc-a9f6">+1 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Blessing of the Lady" hidden="false" id="8a35-b5d4-1652-b3d" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Blessing....</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Close Order" hidden="false" id="883e-e1b1-4fe9-5912" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit consisting of models with this special rule may adopt a Close Order formation.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Crossbow" hidden="false" id="fca0-3c32-72da-53b9" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Crossbow desc...</characteristic>
      </characteristics>
    </profile>
    <profile name="Hatred (X)" hidden="false" id="f4b3-18af-16bf-78dd" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule may re-roll any failed rolls To Hit made against a hatred enemy during the first round of combat.


Which enemies are hated varies from model to model and will be shown in brackets after the name of this special rule (X). Some models hate &apos;all enemies&apos; meaning they hate all enemy models equally.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Magic Resistance" hidden="false" id="90ed-c9be-a611-79cc" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">The Casting roll of any enemy spell (including Bound Spells) that targets a unit that includes one ore more models with this special rule suffers a modifier, as shown in brackets after the name of this special rule (-X).


Note that this special rule is not cumulative. If two or more models in a unit have this special rule, use the highest modifier.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Pistol" hidden="false" id="4c62-cdd4-4e0c-4265" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">S4 AP2</characteristic>
      </characteristics>
    </profile>
    <profile name="Brace of pistols" hidden="false" id="cdb0-f5d2-68e0-205f" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">2xS4 AP2</characteristic>
      </characteristics>
    </profile>
    <profile name="Stubborn" hidden="false" id="e351-bbd6-f470-b604" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50"/>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Full Plate Armour" hidden="false" id="9a1d-38b0-7d7-7552" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Armour" typeId="adcd-c649-e6fc-a9f6">+3 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Shieldwall" hidden="false" id="32f7-8e30-3fe8-b11e" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Once per game, during a turn in which it was charged, a unit with this special rule that is arrayed in a Close Order formation, and that is equipped with and chooses to use shields,may Give Ground rather than Fall Back in Good Order.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Handgun" hidden="false" id="4035-287b-e117-6b9b" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">24&quot; S4 AP-1 Armour Bane(1), Ponderous</characteristic>
      </characteristics>
    </profile>
    <profile name="Veteran" hidden="false" id="4022-c403-b083-ba83" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If the majority of the models in a unit have this special rule, the unit may re-roll any failed Leadership test.


Note that a Break test is not a Leadership test.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Move Through Cover" hidden="false" id="e83e-f127-1904-3858" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Models with this special rule do not suffer any modifier to their Movement characteristic for moving through difficult or dangerous terrain. In addition, a model with this special rule may re-roll any rolls of 1 when making Dangerous Terrain tests.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Open Order" hidden="false" id="5b67-8535-146c-7cea" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Open Order</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Scouts" hidden="false" id="fe5e-8838-7fbd-a7ec" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Units with this special rule may be deployed after all other units from both armies. They can be deployed anywhere on the battlefield that is more than 12&quot; away from an enemy model. If deployed in this way, Scouts cannot declare a charge during their first turn.


If both armies contain Scouts, a roll-off should determine which player deploys Scouts first. The player then alternate deploying their scouting units one at a time, starting with the player who won the roll-off.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Skirmishers" hidden="false" id="59a5-7eca-ee35-96ac" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit consisting of models with this special rule may adopt a Skirmish formation.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Detachment" hidden="false" id="559-d4c6-b2e8-500f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit with this special rule can be fielded as a detachment.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Ambushers" hidden="false" id="8c0b-6fe6-dc06-512" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit with this special rule may be held on reserve rather than be deployed on the start of the game. From the beginning of round two onwards roll a D6 during each of your Start of Turn sub phases for each unit of Ambushers in your army that is held on reserve. On a roll of 1-3 the unit is delayed ...????</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Vanguard" hidden="false" id="691e-10ec-4f7c-a2c4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">After deployment units with this special rule may make a Vanguard move. A unit making a Vanguard move moves as described on the Basic Movement rules. It may manoeuvre normally but cannot march.


If both armies contain Vanguard units a roll off determines who moves first. The players then alternate moving their Vanguard units one at a time starting with the player who won the roll-off.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Warband" hidden="false" id="505f-e12d-2e36-31d0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Unless it is fleeing, a Warband gains ...</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Impetuous" hidden="false" id="b664-8530-a988-7ba9" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If during the Declare Charge &amp; Charge Reaction sub-phase of its turn, a unit that includes one or more Impetuous models is able to declare charge, roll a D6. On a roll of 1-3, the unit must declare a charge. On a roll of 4+, the unit may act as normal.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Light Armour" hidden="false" id="dbb2-4d85-84c2-528c" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Armour" typeId="adcd-c649-e6fc-a9f6">+1 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Warbow" hidden="false" id="20c1-9325-e604-a558" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Range 24&quot; S S, Volley Fire</characteristic>
      </characteristics>
    </profile>
    <profile name="Additional Hand Weapon" hidden="false" id="300e-9667-fc8c-c763" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Extra Atacks (+1), Require Two Hands</characteristic>
      </characteristics>
    </profile>
    <profile name="Throwing Spear" hidden="false" id="8a6-cc93-b5fd-6636" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Fight in Extra Rank. It can only be used during a turn in which welder charged. In subsequent turns (or if the welder did not charge) the model must use its hand weapon instead.</characteristic>
      </characteristics>
    </profile>
    <profile name="Thrusting Spear" hidden="false" id="85-9154-7dc1-ddc6" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Fight in Extra Rank. Models whose troop type is &apos;infantry&apos; only. A model wielding a thrusting spear cannot m ake a supporting attack during a turn in which it charged. During a turn it was charged in its front arc, a model wielding a thrusting spear gains +1 modifier to its Initiative against the charging unit(s)</characteristic>
      </characteristics>
    </profile>
    <profile name="Frenzy" hidden="false" id="3b0c-a477-8823-3a25" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A Frenzied model has a +1 modifier to its Attacks characteristic. This modifier does not apply to the model&apos;s mount (i.e. the mount of a cavalry model), to the beasts that drag it (in the case of a chariot), or to its rider (in the case of a monster).
In addition:
- If the majority of the models in a unit are Frenzied, the unit automatically passes any Fear, Panic or Terror tests is required to make.
- If a unit that includes one or more Frenzied models is able to declare a charge during the Declare Charges &amp; Charge Reactions sub-phase of its turn, it must do so.
- If the majority of the models in a unit are Frenzied, it cannot choose to Flee to a charge reaction, nor can it ever choose to make a Restrain test.
Loosing Frenzy: Unlike other special rules Frenzy can be lost during a game. Any model that loses a round of combat will immediately lose this special rule.

</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Armour Bane (X)" hidden="false" id="2af0-975f-bb14-8b8f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If a model with this special rule rolls a natural 6 when making a roll To Wound, the Armour Piercing characteristic of its weapon is improved by the amount shown in brackets after the name of this special rule (X).


For example, if a natural 6 is rolled when rolling To Wound with a weapon that has an AP of &quot;-&quot; and the Armour Bane (1) special rule its AP counts as being -1 when making an Armour Save roll against that wound.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Armour Hide (X)" hidden="false" id="5450-cbf1-3e74-254a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">The hide of some creatures forms natural armour and improves their armour value ( and that of their rider). By how much armour value is improved varies from model to model, as shown in brackets after the name of this special rule (X).


Note that a model that wears no armour is considerer to have an armour value of 7+ for the purposes of rules that improve armour value.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Breath Weapon" hidden="false" id="e049-8b4d-23e9-7505" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with a Breath Weapon can use it once per round, during the Shooting phase of its turn. Place the ????</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Counter Charge" hidden="false" id="5186-798d-69d-6545" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">This special rule can only be used by units that consists entirely of models with this special rule. When a unit with this special rule is charged in its front arc by an enemy unit whose troop type is &apos;cavalry&apos;, &apos;chariot&apos; or &apos;monster&apos;, it may declare a &apos;Counter Charge&apos; charge reaction.


Counter charge: The unit surges forward to meet the enemy charge. Measure the distance between the two units. If the distance is less than the Movement characteristic of the charging unit, the charged unit has not enough time to meet the enemy charge and must either Hold of Flee instead.


Otherwise, pivot the unit about its center so that it is facing directly towards the centre of the charging enemy unit. After pivoting, the unit moves D3+1&quot; directly towards the enemy unit. Both units are considered to have charged during this turn.


Fleeing units and units already engaged in combat when charged cannot Counter Charge. A unit can only Counter Charge in response to one charge per turn, even if charged by multiple units. Once all charges have been declared, the inactive player can choose which charging unit to Counter Charge. The unit will then Hold against the other charging units.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Cumbersome" hidden="false" id="9db1-2d1d-b6dd-6ff1" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Weapons with this special rule cannot be used when making a Stand &amp; Shoot charge reaction.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Dragged Along" hidden="false" id="a042-c2f5-ebcb-2bab" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule that begins its movement within 1&quot; of a friendly unit whose troop type is &apos;infantry&apos; that is not fleeing and that contains ten or more models may replace its Movement characteristic with that of the unit.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Drilled" hidden="false" id="1f64-3ddc-db58-12fb" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Unless it is fleeing, a Drilled unit may perform a free redraw the ranks manoeuvre immediately before moving. Once this manoeuvre is complete, the unit moves as normal. In addition a Drilled unit can march whilst within 8&quot; of an enemy unit without first having to make a Leadership test.


Note that any character that joins a Drilled unit is considered to be Drilled as well.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Ethereal" hidden="false" id="6561-8029-dac3-162" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Ethereal creatures treat all terrain as open ground for the purpose of movement. They cannot end their movement inside impassible terrain, though they can pass through it. In addition, Ethereal creatures can only be wounded by Magical attacks. Characters that are not Ethereal cannot join units that are, and vice versa.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Evasive" hidden="false" id="9fff-999f-6e96-e149" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Once per turn, when the unit is declared the target during the enemy Shooting phase, it may choose to Fall Back in Good Order and will flee directly away form the enemy unit shooting at it. Once this unit has completed its move, the enemy unit may continue with its shooting as declared.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Extra Attacks (+X)" hidden="false" id="23c7-1aeb-5f02-c9e1" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule has a modifier to its Attacks characteristic, as shown in the brackets after the name of this special rule (+X). If this modifier is determined by the roll of a dice, roll when the model&apos;s combat is chosen during any Choose &amp; Fight sub phase.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Fast Cavalry" hidden="false" id="df-a39-e62-1c57" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If all of the models (including Characters) within a unit arrayed in an Open Order formation have this special rule, the unit may perform its Quick Turn even if marched.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Fear" hidden="false" id="5ec9-a98-d8c5-e18b" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Models with this special rule cannot flee.


If a unit whishes to declare a charge against an enemy unit that both causes Fear and has a higher Unit Strength, it must first make a Leadership test. If this test is failed, the unit cannot charge. It does not move and is considered to have make a failed charge. If this test is passed, the unit can charge as normal.


If a unit is engaged with an enemy unit that both causes Fear and has a higher Unit Strength when its combat is chosen during any Choose &amp; Fight Combat sub-phase, it must make a Leadership test. If this test is failed, any models in the unit that direct their attacks against the Fear-causing enemy suffer a -1 modifier to their rolls To Hit.

A unit only needs to make one Fear test per turn. Models that cause Fear are immune to Fear. A unit that does not cause Fear does not become immune to Fear when joined by a character that does.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Feigned Flight" hidden="false" id="eea7-89d9-a996-403c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If this unit chooses to Flee (or Fire &amp; Flee) as a charge reaction, it automatically rallies at the end of its move.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Fight In Extra Rank" hidden="false" id="b49e-b47f-fb38-596e" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule may make a supporting attack.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Fire &amp; Flee" hidden="false" id="1a06-31aa-cbfe-1a5" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit with this special rule that is also armed with missile weapons may declare that it will &apos;Fire &amp; Flee&apos; as a charge reaction.


Fire and Flee: The unit launches a volley of weapons fire before turning to flee form the enemy. If a unit with this special rule is armed with missile weapons and can draw line of sight to the charging unit, it may declare that it will Fire &amp; Flee. The unit will Stand &amp; Shoot before turning tail and fleeing from the charge. However, due to the time spent shooting at the charging foe, when making its Flee roll the unit rolls two D6 and discards the lowest result. If both dice roll the same result, discard either.


Note that, if the distance between this unit and the charging unit is less than the Movement characteristic of the charging unit, this unit must either Hold or Flee.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="First Charge" hidden="false" id="785a-2886-af42-dce9" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If this unit&apos;s first charge of the game is successful (i.e. if the unit makes contact with the charge target), the charge target becomes Disrupted unit the end of the Combat phase of that turn.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Flaming Attacks" hidden="false" id="e45d-952-f679-ae2c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Any attack made of hits caused by a model with this special rule or made using a weapon or spell with this special rule, is a &quot;Flaming&quot; attack. In addition, a model with this special rule causes Fear to models which troop type is &apos;war beasts&apos; or &apos;swarms&apos;.


Unless otherwise stated, a model with this special rule makes Flaming attacks both when shooting and in combat (though any spells cast by the model are unaffected, as are any attacks made with magic weapons they might be weilding).</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Flammable" hidden="false" id="8f64-6d4c-466b-1b94" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule cannot make a Regeneration save against a wound caused by a Flaming attack.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Fly (X)" hidden="false" id="c557-6102-9a35-bbcd" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A model with this special rule can Fly. Models that can Fly can choose wither to move normally on the ground (using their Movement characteristic), or to move by flying. How many inches a model can Fly varies from model to model, and will be shown in brackets after the name of this special rule (X). Models tat choose to move by flying:

- May move as normal (i.e. they may charge, march and manoeuvre as if moving on the ground), except that they are able to pass freely above other models, units and terrain features without any penalty, and they can march whilst within 8&quot; of an enemy unit without first having to make a Leadership test.


- May end their movement in terrain, but will suffer its effects if they do. They cannot end their movement &apos;on top&apos; of impassable terrain or another unit, or within 1&quot; of an enemy unit.


Models that can Fly must begin and end all their movement on the ground. A character with this special rule cannot join a unit without this special rule, and vice versa.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Furious Charge" hidden="false" id="eaca-69a2-8b6a-81c6" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">During a turn in which it made a charge move of 3&quot; or more, a model with this special rule gains a +1 modifier to its Attacks characteristic.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Horde" hidden="false" id="9cba-89a5-1796-5fe4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A unit with this special rule may increase the maximum Rank Bonus it can claim (as determined by its troop type) by one.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Ignores Cover" hidden="false" id="a401-372d-446e-d27c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If a model making a shooting attack has this special rule, it ignores any To Hit modifiers caused by partial or full cover.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Immune to Psychology" hidden="false" id="93d9-c75b-f655-30ac" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If the majority of the models in a unit are Immune to Psychology, the unit automatically passes any Fear, Panic or Terror tests it is required to make. However, if the majority of the models in a unit have this special rule, the unit cannot choose to Flee as a charge reaction.


Note that this special rule does not make a unit immune to any test make against Leadership not stated here.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Killing Blow" hidden="false" id="860b-e13a-4710-9bf0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">If a model with this special rule rolls a natural 6 when making a roll To Wound for an attack made in combat, it ha struck a &apos;Killing Blow&apos;. Enemy models whose troop type is &apos;infantry&apos; or &apos;cavalry&apos; are not permitted an armour save or Regeneration save against a Killing Blow (Ward saves can be attempted as normal). If an enemy model whose troop type is &apos;infantry&apos; or &apos;cavalry&apos; suffers an unsaved wound from Killing Blow, it looses all of its remaining Wounds.


Note that if an attack wounds automatically this special rule cannot be used/</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Levies" hidden="false" id="8cc3-d6f5-da17-6600" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Models with this special rule cannot use Inspiring Presence rule of the army&apos;s general nor the Hold your Ground rule of a Battle Standard. However, little is expected from Levies in battle. Therefore units that do not have this special rule are not required to make a Panic test when a friendly unit of Levies Breaks and flees from combat.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Loner" hidden="false" id="2ecd-c6b3-bd8b-864b" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A character with this special rule cannot be your General and cannot join a unit without this special rule. A unit with this special rule cannot be joined by a character without this special rule.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Magical Attacks" hidden="false" id="2125-6aa2-f782-42bf" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Any attack made or hit caused by a mode with this special rule, or made using a weapon with this special rule, is a &apos;Magical&apos; attack.


Note that all spells are considered to have this special rule, as are any hits caused by magic items.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Mercenaries" hidden="false" id="4d1b-2617-ebdc-4f4d" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Often, an army can include certain units drawn from another army list as mercenaries. Any such units included in your army gain this special rule. Mercenaries cannot use the Inspiring Presence rule of the army&apos;s general nor the Hold the Ground rule of a Battle Standard. Mercenaries cannot be joined by characters drawn form another army list.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
    <profile name="Monster Handlers" hidden="false" id="1084-a4e9-79f-3462" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">A monster with this special rule is accompanied by one or more models representing its handlers. During deployment, position these models anywhere that is adjacent to, an in base contact with, the monster. If the handlers are found to be blocking movement or line of sight, simply move them aside.


In combat, each handler adds its attacks to those of the monster. If the monster suffers an unsaved wound, roll a D6. On a roll of 1-4 the monster looses a Wound, but on a roll of 5+ a handler model suffers the wound instead. If the monster is removed from play, so are its handlers.</characteristic>
        <characteristic name="Parameter" typeId="fe1a-e33f-651a-9cb8"/>
      </characteristics>
    </profile>
  </sharedProfiles>
  <sharedSelectionEntries>
    <selectionEntry type="upgrade" import="true" name="Hand weapon" hidden="false" id="721d-36e3-388a-c0d6" collective="true">
      <infoLinks>
        <infoLink name="Hand Weapon" hidden="false" type="profile" id="c4fd-6287-4ab1-bb65" targetId="ef45-edcd-18bf-fe1d"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="9935-ed77-1e72-9842-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9935-ed77-1e72-9842-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Great weapon" hidden="false" id="2283-26e9-76c3-6048" collective="true">
      <infoLinks>
        <infoLink name="Great Weapon" hidden="false" type="profile" id="4465-7e60-819e-a74f" targetId="88e3-38f0-92d5-b616"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="6e03-7cfb-4459-9b9a-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6e03-7cfb-4459-9b9a-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Shield" hidden="false" id="6192-f9f1-5d53-2042" collective="true">
      <infoLinks>
        <infoLink name="Shield" hidden="false" type="profile" id="5300-a336-be3f-860e" targetId="8997-c74d-3a8d-ecf9"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="9cb6-6690-ad82-be24-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Lance" hidden="false" id="906a-c09d-9f34-a31f" collective="true">
      <infoLinks>
        <infoLink name="Lance" hidden="false" type="profile" id="4bb4-37af-dd08-93dd" targetId="c84c-99b6-75eb-4f40"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="43c1-42a1-9a0a-326e-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="43c1-42a1-9a0a-326e-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Heavy armour" hidden="false" id="62fb-f89d-afc-1cf1" collective="true">
      <infoLinks>
        <infoLink name="Heavy Armour" hidden="false" type="profile" id="38dd-cfd4-ea64-fa1b" targetId="c56e-8d1b-bb4-de99"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="45e-be05-779d-ba20-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="45e-be05-779d-ba20-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Barding" hidden="false" id="718d-9fe8-f8ad-ad3c" collective="true">
      <infoLinks>
        <infoLink name="Barding" hidden="false" type="profile" id="eaf9-36e4-c4fb-f18c" targetId="eb5d-bd8a-c75c-66d7"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="4973-bc30-67f5-cb08-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4973-bc30-67f5-cb08-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Crossbow" hidden="false" id="c3af-77b3-b2d5-20db" collective="true">
      <infoLinks>
        <infoLink name="Crossbow" hidden="false" type="profile" id="5eba-daec-5c9f-719b" targetId="fca0-3c32-72da-53b9"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="cf85-256a-d8a8-b011-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cf85-256a-d8a8-b011-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Throwing Spear" hidden="false" id="9113-238a-ef75-aa23" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2b55-9fe1-4d8d-e594-max"/>
      </constraints>
      <infoLinks>
        <infoLink name="Throwing Spear" hidden="false" type="profile" id="1c94-5f0a-c42a-26aa" targetId="8a6-cc93-b5fd-6636"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Full Plate Armour" hidden="false" id="2505-873d-1655-3b0b" collective="true">
      <infoLinks>
        <infoLink name="Full Plate Armour" hidden="false" type="profile" id="5e28-a07e-24ed-aed0" targetId="9a1d-38b0-7d7-7552"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="12e6-599e-626f-e64"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e78c-1462-8bdf-29fd"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Handgun" hidden="false" id="e2ed-a3fd-dee5-3e9f" collective="true">
      <infoLinks>
        <infoLink name="Handgun" hidden="false" type="profile" id="53c8-39c-1947-edf7" targetId="4035-287b-e117-6b9b"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="94d3-f30-8056-9665"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4d0a-3a4a-44b7-6d6"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Light armour" hidden="false" id="7cab-40e6-f134-de78" collective="true">
      <infoLinks>
        <infoLink name="Light Armour" hidden="false" type="profile" id="95b2-9d59-c3c8-393b" targetId="dbb2-4d85-84c2-528c"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="a829-a78-b8ef-e57a"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="d469-faaa-5523-f75f"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Thrusting Spear" hidden="false" id="99d2-7f59-5c14-3bf7" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="386b-19fa-4c1c-3d68"/>
      </constraints>
      <infoLinks>
        <infoLink name="Thrusting Spear" hidden="false" type="profile" id="dd54-5e8e-6a0d-7ac3" targetId="85-9154-7dc1-ddc6"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Warbow" hidden="false" id="244d-ff04-bdc1-56b8" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f0af-c3d3-876d-5263"/>
      </constraints>
      <infoLinks>
        <infoLink name="Warbow" hidden="false" type="profile" id="7988-5456-f37-1645" targetId="20c1-9325-e604-a558"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Additional Hand Weapon" hidden="false" id="8943-3e16-db2a-b7f3" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="12df-72d-f5b3-d569"/>
      </constraints>
      <infoLinks>
        <infoLink name="Additional Hand Weapon" hidden="false" type="profile" id="1a2d-de59-94a9-b97d" targetId="300e-9667-fc8c-c763"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Pistol" hidden="false" id="d3c7-5222-61e8-9920">
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="618f-5e83-63ef-f591-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="618f-5e83-63ef-f591-max"/>
      </constraints>
      <infoLinks>
        <infoLink name="Pistol" hidden="false" type="profile" id="8882-976e-6ce2-17a0" targetId="4c62-cdd4-4e0c-4265"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Brace of Pistols" hidden="false" id="d8bb-85b0-3575-6029">
      <infoLinks>
        <infoLink name="Brace of pistols" hidden="false" type="profile" id="da9a-ae92-f6bf-6372" targetId="cdb0-f5d2-68e0-205f"/>
      </infoLinks>
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="bb24-f518-d872-575c-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="bb24-f518-d872-575c-max"/>
      </constraints>
    </selectionEntry>
  </sharedSelectionEntries>
  <selectionEntries>
    <selectionEntry type="upgrade" import="true" name="Army Organization" hidden="false" id="4420-68ce-1691-5e59">
      <selectionEntryGroups>
        <selectionEntryGroup name="Group Units By" hidden="false" id="88cb-1ff2-d783-bd51">
          <selectionEntries>
            <selectionEntry type="upgrade" import="true" name="Unit Type" hidden="false" id="5fd8-d493-6066-41ed">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2b09-19f7-a17f-f7b4"/>
              </constraints>
            </selectionEntry>
            <selectionEntry type="upgrade" import="true" name="Unit Category" hidden="false" id="7514-84e7-f585-31b">
              <constraints>
                <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="80a3-c6c6-75c1-d44c"/>
              </constraints>
            </selectionEntry>
          </selectionEntries>
          <constraints>
            <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="775-9051-442b-b596-min"/>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="775-9051-442b-b596-max"/>
          </constraints>
          <categoryLinks>
            <categoryLink targetId="48b5-1583-6fa3-acda" id="172c-5f01-c18d-d51" primary="false" name="Configuration"/>
          </categoryLinks>
        </selectionEntryGroup>
      </selectionEntryGroups>
      <categoryLinks>
        <categoryLink targetId="48b5-1583-6fa3-acda" id="f395-2d94-b885-eff8" primary="true" name="Configuration"/>
      </categoryLinks>
    </selectionEntry>
  </selectionEntries>
</gameSystem>
