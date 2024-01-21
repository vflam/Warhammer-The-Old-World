<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-31d1-bf57-53ea-ad55" name="Warhammer The Old World" battleScribeVersion="2.03" revision="38" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema" library="true" authorName="Flammy" authorContact="Discord: vflam" authorUrl="www.newrecruit.eu">
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
    <categoryEntry name="Heavy Infantry" hidden="false" id="ca7e-d004-ccde-caf3"/>
    <categoryEntry name="Light Cavalry" hidden="false" id="600c-7d08-5be1-fe0c"/>
    <categoryEntry name="Heavy Chariot" hidden="false" id="d768-7cf0-de0a-c249"/>
    <categoryEntry name="Light Chariot" hidden="false" id="7dce-b0f0-2217-2820"/>
    <categoryEntry name="Monstrous Creature" hidden="false" id="fb36-5275-617-c895"/>
    <categoryEntry name="Monstrous Infantry" hidden="false" id="5c55-f9d6-b181-92f8"/>
    <categoryEntry name="Heavy Cavalry" hidden="false" id="5165-d052-cfc2-5887"/>
    <categoryEntry name="War Beasts" hidden="false" id="19f9-8dd8-bba4-625b"/>
    <categoryEntry name="NO EXPORT" hidden="true" id="49a9-ce63-af1a-18f7"/>
    <categoryEntry name="Monstrous Cavalry" hidden="false" id="2c85-5f2b-9288-1257"/>
    <categoryEntry name="Behemoth" hidden="false" id="3755-6732-99b2-c713"/>
    <categoryEntry name="25PTSLIMIT" hidden="true" id="9ec3-3046-6db2-dd57"/>
    <categoryEntry name="Swarms" hidden="false" id="db92-54fd-e023-d69f"/>
    <categoryEntry name="VETERAN UPGRADE" hidden="true" id="925c-b77-1d36-e3bf"/>
    <categoryEntry name="DRILLED UPGRADE" hidden="true" id="7913-acb6-d065-2dab"/>
    <categoryEntry name="STANDARD UPGRADE" hidden="true" id="caab-4ac8-e0ba-d843"/>
    <categoryEntry name="OPEN ORDER UPGRADE" hidden="true" id="c2e6-2e17-855-2eb3"/>
    <categoryEntry name="VANGUARD UPGRADE2" hidden="true" id="871f-ae50-ed04-428a"/>
    <categoryEntry name="FIRE AND FLEE UPGRADE" hidden="true" id="2661-a58f-ff4f-20cb"/>
    <categoryEntry name="VANGUARD UPGRADE" hidden="true" id="1008-a8fa-67f7-3e39"/>
    <categoryEntry name="STUBBORN UPGRADE1" hidden="true" id="2392-f089-8a93-dfc3"/>
    <categoryEntry name="VETERAN UPGRADE1" hidden="true" id="e35d-fb38-21b-1a66"/>
    <categoryEntry name="SCOUTS UPGRADE2" hidden="true" id="a2e3-9206-f023-b4c8"/>
    <categoryEntry name="SKIRMISHERS UPGRADE1" hidden="true" id="9c9-dc8b-eb73-d90b"/>
    <categoryEntry name="AMBUSHERS UPGRADE1" hidden="true" id="144e-409-8908-7fce"/>
    <categoryEntry name="RESERVE MOVE UPGRADE1" hidden="true" id="8b11-b8bd-b9fc-7459"/>
    <categoryEntry name="DRILLED UPGRADE1" hidden="true" id="ca73-6522-eb84-b481"/>
    <categoryEntry name="NEHEKHARAN PHALANX UPGRADE1" hidden="true" id="c008-2eab-5394-1224"/>
    <categoryEntry name="COUNTER CHARGE1" hidden="true" id="b248-98ef-5ad0-5b20"/>
    <categoryEntry name="FRENZY UPGRADE1" hidden="true" id="b442-ef51-d930-9987"/>
    <categoryEntry name="SKIRMISHERS UPGRADE" hidden="true" id="5deb-f246-715f-2a08"/>
    <categoryEntry name="FEIGNED FLIGHT UPGRADE2" hidden="true" id="b6b1-37fc-a1ec-3464"/>
    <categoryEntry name="STUBBORN UPGRADE2" hidden="true" id="290f-11de-6a66-410b"/>
    <categoryEntry name="FRENZY UPGRADE2" hidden="true" id="a708-6cc7-6c0f-ad82"/>
    <categoryEntry name="AMBUSHERS UPGRADE10" hidden="true" id="c86a-7a74-e1c8-95a7"/>
    <categoryEntry name="CHARIOT CREW" hidden="true" id="4cf7-bf85-308d-c29a"/>
    <categoryEntry name="FRENZY UPGRADE3" hidden="true" id="4e48-1ecf-d4c5-ef0a"/>
    <categoryEntry name="FRENZY UPGRADE" hidden="true" id="e41e-3817-ab1e-3b59"/>
  </categoryEntries>
  <forceEntries>
    <forceEntry id="8214-cf48-b1cd-5f5e" name="Standard">
      <categoryLinks>
        <categoryLink name="Characters" hidden="false" id="a936-639f-e214-e9d" targetId="a4cc-15c9-cfae-1b3b" type="category">
          <constraints>
            <constraint type="max" value="50" field="limit::points" scope="roster" shared="true" id="abe-35b3-cb6f-604d" percentValue="true"/>
          </constraints>
        </categoryLink>
        <categoryLink id="ab07-e23d-ab54-8822" targetId="f0e3-2e32-8866-ea32" name="Core" type="category">
          <constraints>
            <constraint type="min" value="25" field="limit::points" scope="roster" shared="true" id="563-332d-aa18-dad" percentValue="true" includeChildSelections="true"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Special" hidden="false" id="c64f-52a4-9d57-2c86" targetId="633f-f67a-1b6a-d203" type="category">
          <constraints>
            <constraint type="max" value="50" field="selections" scope="roster" shared="true" id="2212-630f-3cec-36df" percentValue="true" includeChildSelections="true"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Rare" hidden="false" id="e603-b373-46b1-4237" targetId="2bfe-5863-46fe-d284" type="category">
          <constraints>
            <constraint type="max" value="25" field="selections" scope="roster" shared="true" id="f0f7-32b6-d076-214a" percentValue="true" includeChildSelections="true"/>
          </constraints>
        </categoryLink>
        <categoryLink name="Mercenaries" hidden="false" id="6032-af52-ae71-e755" targetId="5b84-2c3c-869d-3522" type="category">
          <constraints>
            <constraint type="max" value="20" field="selections" scope="roster" shared="true" id="4bbb-90a8-3513-cbec" percentValue="true" includeChildSelections="true"/>
          </constraints>
        </categoryLink>
      </categoryLinks>
    </forceEntry>
  </forceEntries>
  <costTypes>
    <costType id="points" name="pts" defaultCostLimit="2000"/>
  </costTypes>
  <profileTypes>
    <profileType name="Unit" hidden="false" id="2878-9a1f-dd74-48e3" sortIndex="7">
      <characteristicTypes>
        <characteristicType id="5d94-6b94-bd89-1944" name="Troop Type"/>
        <characteristicType id="80a1-bb6f-66e4-4a5b" name="Unit Size"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Model" hidden="false" id="b070-143a-73f-2772" sortIndex="1">
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
    <profileType name="Base" hidden="false" id="1ae4-7f34-4055-fd5f" sortIndex="19">
      <characteristicTypes>
        <characteristicType id="1adf-d238-57ca-2226" name="Base Size"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Weapon" hidden="false" id="cc88-6a7d-41c9-d63e" sortIndex="2">
      <characteristicTypes>
        <characteristicType id="47f2-ecee-cae0-9ef9" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Special Rule" hidden="false" id="c1ac-c1c8-f9d5-9673" sortIndex="4">
      <characteristicTypes>
        <characteristicType id="9f84-4221-785a-db50" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Armour" hidden="false" id="c14f-740-8107-d34b" sortIndex="3">
      <characteristicTypes>
        <characteristicType id="adcd-c649-e6fc-a9f6" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Command" hidden="false" id="52d4-d959-fe4d-90fa" sortIndex="8">
      <characteristicTypes>
        <characteristicType id="441a-ef3a-c07e-95f" name="Description"/>
      </characteristicTypes>
    </profileType>
    <profileType name="Spell" hidden="false" id="8232-ae14-b1f6-b4df" sortIndex="6">
      <characteristicTypes>
        <characteristicType id="8a2b-690b-e552-6aa0" name="Number"/>
        <characteristicType id="c2ca-5fd1-5e9d-bc90" name="Type"/>
        <characteristicType id="d84d-3b8b-654a-9e1a" name="Casting Value"/>
        <characteristicType id="1043-a0ad-2909-dd28" name="Range"/>
        <characteristicType id="64ba-31-acf0-5a" name="Effect"/>
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
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Unless specified otherwise, all models are assumed to be equipped with a hand weapon.</characteristic>
      </characteristics>
    </profile>
    <profile name="Shield" hidden="false" id="8997-c74d-3a8d-ecf9" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Description" typeId="adcd-c649-e6fc-a9f6">A model that carries a shield improves its armour value by 1. For example, a model equipped with a light armour has an armour value of 6+. Should that model also carry a shield, its armour value would be improved by 1 by lowering the target number from 6+ to 5+.


Note that if a model uses a weapon that has the Requires To Hands special rule in combat, it cannot also use a shield.</characteristic>
      </characteristics>
    </profile>
    <profile name="Great Weapon" hidden="false" id="88e3-38f0-92d5-b616" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+2 AP-2 Armour Bane (1), Requires Two Hands, Strike Last</characteristic>
      </characteristics>
    </profile>
    <profile name="Longbow" hidden="false" id="c84c-99b6-75eb-4f40" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">30&quot; S3 Armour Bane (1), Volley Fire</characteristic>
      </characteristics>
    </profile>
    <profile name="Heavy Armour" hidden="false" id="c56e-8d1b-bb4-de99" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Description" typeId="adcd-c649-e6fc-a9f6">+2 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Barding" hidden="false" id="eb5d-bd8a-c75c-66d7" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Description" typeId="adcd-c649-e6fc-a9f6">A model that rides a barded mount improves its armour value by 1. For example, a cavalry model equipped with heavy armour has a armour save of 5+. Should that model&apos;s mount be barded, its armour value would be improved by 1 by lowering the target number from 5+ to 4+.</characteristic>
      </characteristics>
    </profile>
    <profile name="Close Order" hidden="false" id="883e-e1b1-4fe9-5912" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit consisting of models with this special rule may adopt a Close Order formation.</characteristic>
      </characteristics>
    </profile>
    <profile name="Brace of Repeater Handbows" hidden="false" id="fca0-3c32-72da-53b9" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S3 Multiple Shots (4), Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Hatred" hidden="false" id="f4b3-18af-16bf-78dd" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule may re-roll any failed rolls To Hit made against a hatred enemy during the first round of combat.

Which enemies are hated varies from model to model and will be shown in brackets after the name of this special rule (X). Some models hate &apos;all enemies&apos; meaning they hate all enemy models equally.</characteristic>
      </characteristics>
    </profile>
    <profile name="Magic Resistance" hidden="false" id="90ed-c9be-a611-79cc" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">The Casting roll of any enemy spell (including Bound Spells) that targets a unit that includes one ore more models with this special rule suffers a modifier, as shown in brackets after the name of this special rule (-X).

Note that this special rule is not cumulative. If two or more models in a unit have this special rule, use the highest modifier.</characteristic>
      </characteristics>
    </profile>
    <profile name="Pistol" hidden="false" id="4c62-cdd4-4e0c-4265" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S4 AP-1 Armour Bane (1), Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Brace of Pistols" hidden="false" id="cdb0-f5d2-68e0-205f" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S4 AP-1 Armour Bane(1), Multiple Shots (2), Quick Shot.
In combat: Extra Attacks (+1), Requires To Hands.</characteristic>
      </characteristics>
    </profile>
    <profile name="Stubborn" hidden="false" id="e351-bbd6-f470-b604" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="178" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">The first time the unit is required to make a break test it may choose no to and will automatically Fall Back in Good Order instead even if the Unit Strength of the winning side is more than twice that of the losing side. A unit that is not Stubborn does not become Stubborn when joined by a character that is. A Stubborn character cannot use this special rule whilst part of a unit that are not Stubborn.</characteristic>
      </characteristics>
    </profile>
    <profile name="Full Plate Armour" hidden="false" id="9a1d-38b0-7d7-7552" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Description" typeId="adcd-c649-e6fc-a9f6">+3 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Shieldwall" hidden="false" id="32f7-8e30-3fe8-b11e" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="177" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Once per game, during a turn in which it was charged, a unit with this special rule that is arrayed in a Close Order formation, and that is equipped with and chooses to use shields,may Give Ground rather than Fall Back in Good Order.</characteristic>
      </characteristics>
    </profile>
    <profile name="Handgun" hidden="false" id="4035-287b-e117-6b9b" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">24&quot; S4 AP-1 Armour Bane(1), Ponderous</characteristic>
      </characteristics>
    </profile>
    <profile name="Veteran" hidden="false" id="4022-c403-b083-ba83" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If the majority of the models in a unit have this special rule, the unit may re-roll any failed Leadership test.

Note that a Break test is not a Leadership test.</characteristic>
      </characteristics>
    </profile>
    <profile name="Move Through Cover" hidden="false" id="e83e-f127-1904-3858" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="174" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule do not suffer any modifier to their Movement characteristic for moving through difficult or dangerous terrain. In addition, a model with this special rule may re-roll any rolls of 1 when making Dangerous Terrain tests.</characteristic>
      </characteristics>
    </profile>
    <profile name="Open Order" hidden="false" id="5b67-8535-146c-7cea" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="175" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit consisting of models with this special rule may adopt an Open Order formation.</characteristic>
      </characteristics>
    </profile>
    <profile name="Scouts" hidden="false" id="fe5e-8838-7fbd-a7ec" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="177" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Units with this special rule may be deployed after all other units from both armies. They can be deployed anywhere on the battlefield that is more than 12&quot; away from an enemy model. If deployed in this way, Scouts cannot declare a charge during their first turn.

If both armies contain Scouts, a roll-off should determine which player deploys Scouts first. The player then alternate deploying their scouting units one at a time, starting with the player who won the roll-off.</characteristic>
      </characteristics>
    </profile>
    <profile name="Skirmishers" hidden="false" id="59a5-7eca-ee35-96ac" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="177" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit consisting of models with this special rule may adopt a Skirmish formation.</characteristic>
      </characteristics>
    </profile>
    <profile name="Detachment" hidden="false" id="559-d4c6-b2e8-500f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule can be fielded as a detachment.</characteristic>
      </characteristics>
    </profile>
    <profile name="Ambushers" hidden="false" id="8c0b-6fe6-dc06-512" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="166" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule may be held on reserve rather than be deployed on the start of the game. From the beginning of round two onwards roll a D6 during each of your Start of Turn sub phases for each unit of Ambushers in your army that is held on reserve. On a roll of 1-3 the unit is delayed until your next turn at least. On a roll of 4+, the unit arrives entering the battlefield as reinforcements during the Compulsory Moves sub-phase. The unit may be placed on any edge of the battlefield chosen by its controlling player, but cannot be placed within 8&quot; of an enemy model. If any Ambushers are still held on reserve by the start of round five, they arrive automatically.</characteristic>
      </characteristics>
    </profile>
    <profile name="Vanguard" hidden="false" id="691e-10ec-4f7c-a2c4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">After deployment units with this special rule may make a Vanguard move. A unit making a Vanguard move moves as described on the Basic Movement rules. It may manoeuvre normally but cannot march.

If both armies contain Vanguard units a roll off determines who moves first. The players then alternate moving their Vanguard units one at a time starting with the player who won the roll-off.</characteristic>
      </characteristics>
    </profile>
    <profile name="Warband" hidden="false" id="505f-e12d-2e36-31d0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Unless it is fleeing, a Warband gains .????</characteristic>
      </characteristics>
    </profile>
    <profile name="Impetuous" hidden="false" id="b664-8530-a988-7ba9" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If during the Declare Charge &amp; Charge Reaction sub-phase of its turn, a unit that includes one or more Impetuous models is able to declare charge, roll a D6. On a roll of 1-3, the unit must declare a charge. On a roll of 4+, the unit may act as normal.</characteristic>
      </characteristics>
    </profile>
    <profile name="Light Armour" hidden="false" id="dbb2-4d85-84c2-528c" typeId="c14f-740-8107-d34b" typeName="Armour">
      <characteristics>
        <characteristic name="Description" typeId="adcd-c649-e6fc-a9f6">+1 Armour Save</characteristic>
      </characteristics>
    </profile>
    <profile name="Warbow" hidden="false" id="20c1-9325-e604-a558" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Range 24&quot; S S, Volley Fire</characteristic>
      </characteristics>
    </profile>
    <profile name="Additional Hand Weapon" hidden="false" id="300e-9667-fc8c-c763" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Extra Atacks (+1), Require Two Hands</characteristic>
      </characteristics>
    </profile>
    <profile name="Throwing Spear" hidden="false" id="8a6-cc93-b5fd-6636" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Fight in Extra Rank. A throwing spear can only be used during a turn in which the wielder charged. In subsequent turns (or if the wielder did not charge) the model must use its hand weapon instead.</characteristic>
      </characteristics>
    </profile>
    <profile name="Thrusting Spear" hidden="false" id="85-9154-7dc1-ddc6" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Fight in Extra Rank. Models whose troop type is &apos;infantry&apos; only. A model wielding a thrusting spear cannot m ake a supporting attack during a turn in which it charged. During a turn it was charged in its front arc, a model wielding a thrusting spear gains +1 modifier to its Initiative against the charging unit(s)</characteristic>
      </characteristics>
    </profile>
    <profile name="Frenzy" hidden="false" id="3b0c-a477-8823-3a25" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="170" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A Frenzied model has a +1 modifier to its Attacks characteristic. This modifier does not apply to the model&apos;s mount (i.e. the mount of a cavalry model), to the beasts that drag it (in the case of a chariot), or to its rider (in the case of a monster).
In addition:

- If the majority of the models in a unit are Frenzied, the unit automatically passes any Fear, Panic or Terror tests is required to make.
- If a unit that includes one or more Frenzied models is able to declare a charge during the Declare Charges &amp; Charge Reactions sub-phase of its turn, it must do so.
- If the majority of the models in a unit are Frenzied, it cannot choose to Flee to a charge reaction, nor can it ever choose to make a Restrain test.
Loosing Frenzy: Unlike other special rules Frenzy can be lost during a game. Any model that loses a round of combat will immediately lose this special rule.</characteristic>
      </characteristics>
    </profile>
    <profile name="Armour Bane" hidden="false" id="2af0-975f-bb14-8b8f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a model with this special rule rolls a natural 6 when making a roll To Wound, the Armour Piercing characteristic of its weapon is improved by the amount shown in brackets after the name of this special rule (X).

For example, if a natural 6 is rolled when rolling To Wound with a weapon that has an AP of &quot;-&quot; and the Armour Bane (1) special rule its AP counts as being -1 when making an Armour Save roll against that wound.</characteristic>
      </characteristics>
    </profile>
    <profile name="Armour Hide" hidden="false" id="5450-cbf1-3e74-254a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">The hide of some creatures forms natural armour and improves their armour value ( and that of their rider). By how much armour value is improved varies from model to model, as shown in brackets after the name of this special rule (X).

Note that a model that wears no armour is considerer to have an armour value of 7+ for the purposes of rules that improve armour value.</characteristic>
      </characteristics>
    </profile>
    <profile name="Breath Weapon" hidden="false" id="e049-8b4d-23e9-7505" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="166" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with a Breath Weapon can use it once per round, during the Shooting phase of its turn. Place the flame template, with its broad end over the intended target and its narrow end touching the model&apos;s base edge anywhere along its front arc. The template must lie entirely within the model&apos;s vision arc. Any model whose base lies underneath the template risks being hit. The Strength and any special rules of the breath weapon will be detailed in the creature&apos;s rules.

Breath weapons cannot be used when making a [Stand &amp; Shoot] charge reaction, or when the model is engaged in combat.</characteristic>
      </characteristics>
    </profile>
    <profile name="Counter Charge" hidden="false" id="5186-798d-69d-6545" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">This special rule can only be used by units that consists entirely of models with this special rule. When a unit with this special rule is charged in its front arc by an enemy unit whose troop type is &apos;cavalry&apos;, &apos;chariot&apos; or &apos;monster&apos;, it may declare a &apos;Counter Charge&apos; charge reaction.

Counter charge: The unit surges forward to meet the enemy charge. Measure the distance between the two units. If the distance is less than the Movement characteristic of the charging unit, the charged unit has not enough time to meet the enemy charge and must either Hold of Flee instead.

Otherwise, pivot the unit about its center so that it is facing directly towards the centre of the charging enemy unit. After pivoting, the unit moves D3+1&quot; directly towards the enemy unit. Both units are considered to have charged during this turn.

Fleeing units and units already engaged in combat when charged cannot Counter Charge. A unit can only Counter Charge in response to one charge per turn, even if charged by multiple units. Once all charges have been declared, the inactive player can choose which charging unit to Counter Charge. The unit will then Hold against the other charging units.</characteristic>
      </characteristics>
    </profile>
    <profile name="Cumbersome" hidden="false" id="9db1-2d1d-b6dd-6ff1" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Weapons with this special rule cannot be used when making a Stand &amp; Shoot charge reaction.</characteristic>
      </characteristics>
    </profile>
    <profile name="Dragged Along" hidden="false" id="a042-c2f5-ebcb-2bab" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule that begins its movement within 1&quot; of a friendly unit whose troop type is &apos;infantry&apos; that is not fleeing and that contains ten or more models may replace its Movement characteristic with that of the unit.</characteristic>
      </characteristics>
    </profile>
    <profile name="Drilled" hidden="false" id="1f64-3ddc-db58-12fb" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Unless it is fleeing, a Drilled unit may perform a free redress the ranks manoeuvre immediately before moving. Once this manoeuvre is complete, the unit moves as normal. In addition a Drilled unit can march whilst within 8&quot; of an enemy unit without first having to make a Leadership test.

Note that any character that joins a Drilled unit is considered to be Drilled as well.</characteristic>
      </characteristics>
    </profile>
    <profile name="Ethereal" hidden="false" id="6561-8029-dac3-162" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Ethereal creatures treat all terrain as open ground for the purpose of movement. They cannot end their movement inside impassible terrain, though they can pass through it. In addition, Ethereal creatures can only be wounded by Magical attacks. Characters that are not Ethereal cannot join units that are, and vice versa.</characteristic>
      </characteristics>
    </profile>
    <profile name="Evasive" hidden="false" id="9fff-999f-6e96-e149" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="168" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Once per turn, when the unit is declared the target during the enemy Shooting phase, it may choose to Fall Back in Good Order and will flee directly away form the enemy unit shooting at it. Once this unit has completed its move, the enemy unit may continue with its shooting as declared.</characteristic>
      </characteristics>
    </profile>
    <profile name="Extra Attacks" hidden="false" id="23c7-1aeb-5f02-c9e1" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule has a modifier to its Attacks characteristic, as shown in the brackets after the name of this special rule (+X). If this modifier is determined by the roll of a dice, roll when the model&apos;s combat is chosen during any Choose &amp; Fight sub phase.</characteristic>
      </characteristics>
    </profile>
    <profile name="Fast Cavalry" hidden="false" id="df-a39-e62-1c57" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="168" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If all of the models (including Characters) within a unit arrayed in an Open Order formation have this special rule, the unit may perform its Quick Turn even if marched.</characteristic>
      </characteristics>
    </profile>
    <profile name="Fear" hidden="false" id="5ec9-a98-d8c5-e18b" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="168" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule cannot flee.

If a unit wishes to declare a charge against an enemy unit that both causes Fear and has a higher Unit Strength, it must first make a Leadership test. If this test is failed, the unit cannot charge. It does not move and is considered to have make a failed charge. If this test is passed, the unit can charge as normal.

If a unit is engaged with an enemy unit that both causes Fear and has a higher Unit Strength when its combat is chosen during any Choose &amp; Fight Combat sub-phase, it must make a Leadership test. If this test is failed, any models in the unit that direct their attacks against the Fear-causing enemy suffer a -1 modifier to their rolls To Hit.

A unit only needs to make one Fear test per turn. Models that cause Fear are immune to Fear. A unit that does not cause Fear does not become immune to Fear when joined by a character that does.</characteristic>
      </characteristics>
    </profile>
    <profile name="Feigned Flight" hidden="false" id="eea7-89d9-a996-403c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="168" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If this unit chooses to Flee (or Fire &amp; Flee) as a charge reaction, it automatically rallies at the end of its move.</characteristic>
      </characteristics>
    </profile>
    <profile name="Fight In Extra Rank" hidden="false" id="b49e-b47f-fb38-596e" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="169" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule may make a supporting attack.</characteristic>
      </characteristics>
    </profile>
    <profile name="Fire &amp; Flee" hidden="false" id="1a06-31aa-cbfe-1a5" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="169" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule that is also armed with missile weapons may declare that it will &apos;Fire &amp; Flee&apos; as a charge reaction.

Fire and Flee: The unit launches a volley of weapons fire before turning to flee form the enemy. If a unit with this special rule is armed with missile weapons and can draw line of sight to the charging unit, it may declare that it will Fire &amp; Flee. The unit will Stand &amp; Shoot before turning tail and fleeing from the charge. However, due to the time spent shooting at the charging foe, when making its Flee roll the unit rolls two D6 and discards the lowest result. If both dice roll the same result, discard either.

Note that, if the distance between this unit and the charging unit is less than the Movement characteristic of the charging unit, this unit must either Hold or Flee.</characteristic>
      </characteristics>
    </profile>
    <profile name="First Charge" hidden="false" id="785a-2886-af42-dce9" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="169" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If this unit&apos;s first charge of the game is successful (i.e. if the unit makes contact with the charge target), the charge target becomes Disrupted unit the end of the Combat phase of that turn.</characteristic>
      </characteristics>
    </profile>
    <profile name="Flaming Attacks" hidden="false" id="e45d-952-f679-ae2c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="169" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Any attack made of hits caused by a model with this special rule or made using a weapon or spell with this special rule, is a &quot;Flaming&quot; attack. In addition, a model with this special rule causes Fear to models which troop type is &apos;war beasts&apos; or &apos;swarms&apos;.

Unless otherwise stated, a model with this special rule makes Flaming attacks both when shooting and in combat (though any spells cast by the model are unaffected, as are any attacks made with magic weapons they might be weilding).</characteristic>
      </characteristics>
    </profile>
    <profile name="Flammable" hidden="false" id="8f64-6d4c-466b-1b94" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="169" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule cannot make a Regeneration save against a wound caused by a Flaming attack.</characteristic>
      </characteristics>
    </profile>
    <profile name="Fly" hidden="false" id="c557-6102-9a35-bbcd" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule can Fly. Models that can Fly can choose wither to move normally on the ground (using their Movement characteristic), or to move by flying. How many inches a model can Fly varies from model to model, and will be shown in brackets after the name of this special rule (X). Models tat choose to move by flying:

- May move as normal (i.e. they may charge, march and manoeuvre as if moving on the ground), except that they are able to pass freely above other models, units and terrain features without any penalty, and they can march whilst within 8&quot; of an enemy unit without first having to make a Leadership test.

- May end their movement in terrain, but will suffer its effects if they do. They cannot end their movement &apos;on top&apos; of impassable terrain or another unit, or within 1&quot; of an enemy unit.

Models that can Fly must begin and end all their movement on the ground. A character with this special rule cannot join a unit without this special rule, and vice versa.</characteristic>
      </characteristics>
    </profile>
    <profile name="Furious Charge" hidden="false" id="eaca-69a2-8b6a-81c6" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="171" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">During a turn in which it made a charge move of 3&quot; or more, a model with this special rule gains a +1 modifier to its Attacks characteristic.</characteristic>
      </characteristics>
    </profile>
    <profile name="Horde" hidden="false" id="9cba-89a5-1796-5fe4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="171" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule may increase the maximum Rank Bonus it can claim (as determined by its troop type) by one.</characteristic>
      </characteristics>
    </profile>
    <profile name="Ignores Cover" hidden="false" id="a401-372d-446e-d27c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="171" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a model making a shooting attack has this special rule, it ignores any To Hit modifiers caused by partial or full cover.</characteristic>
      </characteristics>
    </profile>
    <profile name="Immune to Psychology" hidden="false" id="93d9-c75b-f655-30ac" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If the majority of the models in a unit are Immune to Psychology, the unit automatically passes any Fear, Panic or Terror tests it is required to make. However, if the majority of the models in a unit have this special rule, the unit cannot choose to Flee as a charge reaction.

Note that this special rule does not make a unit immune to any test make against Leadership not stated here.</characteristic>
      </characteristics>
    </profile>
    <profile name="Killing Blow" hidden="false" id="860b-e13a-4710-9bf0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a model with this special rule rolls a natural 6 when making a roll To Wound for an attack made in combat, it ha struck a &apos;Killing Blow&apos;. Enemy models whose troop type is &apos;infantry&apos; or &apos;cavalry&apos; are not permitted an armour save or Regeneration save against a Killing Blow (Ward saves can be attempted as normal). If an enemy model whose troop type is &apos;infantry&apos; or &apos;cavalry&apos; suffers an unsaved wound from Killing Blow, it looses all of its remaining Wounds.

Note that if an attack wounds automatically this special rule cannot be used/</characteristic>
      </characteristics>
    </profile>
    <profile name="Levies" hidden="false" id="8cc3-d6f5-da17-6600" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule cannot use Inspiring Presence rule of the army&apos;s general nor the Hold your Ground rule of a Battle Standard. However, little is expected from Levies in battle. Therefore units that do not have this special rule are not required to make a Panic test when a friendly unit of Levies Breaks and flees from combat.</characteristic>
      </characteristics>
    </profile>
    <profile name="Loner" hidden="false" id="2ecd-c6b3-bd8b-864b" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A character with this special rule cannot be your General and cannot join a unit without this special rule. A unit with this special rule cannot be joined by a character without this special rule.</characteristic>
      </characteristics>
    </profile>
    <profile name="Magical Attacks" hidden="false" id="2125-6aa2-f782-42bf" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Any attack made or hit caused by a mode with this special rule, or made using a weapon with this special rule, is a &apos;Magical&apos; attack.

Note that all spells are considered to have this special rule, as are any hits caused by magic items.</characteristic>
      </characteristics>
    </profile>
    <profile name="Mercenaries" hidden="false" id="4d1b-2617-ebdc-4f4d" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="173" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Often, an army can include certain units drawn from another army list as mercenaries. Any such units included in your army gain this special rule. Mercenaries cannot use the Inspiring Presence rule of the army&apos;s general nor the Hold the Ground rule of a Battle Standard. Mercenaries cannot be joined by characters drawn form another army list.</characteristic>
      </characteristics>
    </profile>
    <profile name="Monster Handlers" hidden="false" id="1084-a4e9-79f-3462" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="173" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A monster with this special rule is accompanied by one or more models representing its handlers. During deployment, position these models anywhere that is adjacent to, an in base contact with, the monster. If the handlers are found to be blocking movement or line of sight, simply move them aside.

In combat, each handler adds its attacks to those of the monster. If the monster suffers an unsaved wound, roll a D6. On a roll of 1-4 the monster looses a Wound, but on a roll of 5+ a handler model suffers the wound instead. If the monster is removed from play, so are its handlers.</characteristic>
      </characteristics>
    </profile>
    <profile name="Chariot Runners" hidden="false" id="afa3-a46a-2608-f62c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="167" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Friendly models whose troop type is &apos;chariot&apos; can draw a line of sight over or through models with this special rule and can move through friendly units of Chariot Runners that are in Skirmish formation. If the chariot&apos;s move would result in it ending up &apos;on top&apos; of a Chariot Runner, simple nudge the Chariot Runner aside by the smallest amount possible, to make space for the chariot. Whilst in Skirmish formation units of Chariot Runners can treat friendly chariots that are within 1&quot; of one or more of the unit&apos;s models as part of the unit for the purpose of unit coherency.</characteristic>
      </characteristics>
    </profile>
    <profile name="Howdah" hidden="false" id="b8f6-1cbc-b19-c7b7" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="171" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">To represent its howdah and crew, a behemoth with this special rule has a split profile and follows both the &apos;Split Profile (Chariots)&apos; and &apos;Firing Platform&apos; rules. In all other respects, this model is a behemoth.</characteristic>
      </characteristics>
    </profile>
    <profile name="Impact Hits" hidden="false" id="5c2-e9dd-2715-a0c0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">The number of Impact Hits caused varies from model to model, and will be shown in brackets after the name of this special rile (X). Often, this is determined by the roll of a dice.

Resolving Impact Hits: Impact Hits can only be made by a charging model that moved 3&quot; or more and that is in base contact with the enemy. Impact hits are attacks made in combat that always strike at Initiative 10 (regardless of modifiers), and that hit automatically using the unmodified Strength characteristic of the model.</characteristic>
      </characteristics>
    </profile>
    <profile name="Large Target" hidden="false" id="c822-7ad0-f24a-e4af" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="172" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Enemy models never suffer To Hit modifiers for full or partial cover when shooting at models with this special rule. In addition, a model can draw a line of sight to a model with this special rule over or though other models and vice versa.</characteristic>
      </characteristics>
    </profile>
    <profile name="Monster Slayer" hidden="false" id="6b2f-7ce0-3e27-4ded" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="173" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a model with this special rule rolls a natural 6 when making a roll To Wound for an attack made in combat, it has struck a &apos;Monster Slaying Blow&apos;. Enemy models whose troop type is &apos;monster&apos; are not permitted an armour or Regeneration save against a Monster Slaying Blow (Ward saves can be attempted as normal). If an enemy model whose troop type is &apos;monster&apos; suffers an unsaved wound from a Monster Slaying Blow, it loses all of it remaining Wounds.

Note that if an attack wounds automatically this special rule cannot be used.</characteristic>
      </characteristics>
    </profile>
    <profile name="Motley Crew" hidden="false" id="6359-4018-5cd4-3720" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="174" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Units with this special rule may include models of the same type that are equipped differently to one another, and/or models of different types that fight together in a single unit. If necessary, the army list entry for such units will be accompanied by a brief explanation of the unit&apos;s composition.

Different Weapons: The fighting rank of a Motley Crew may contain models what are armed with different weapons. In each case, the controlling player must roll different batches of dice for the different models, making it clear to their opponent which model&apos;s attacks they represent and where they are being directed. These attacks are made in the Initiative order of the individual models, as usual.

Different Armour: Models within a Motley Crew may have different armour values. In combat, use the armour value of the majority of the models in the fighting rank. Against enemy shooting, use the armour value of the majority of the models in the unit.

Casualty Removal: Against enemy shooting, casualty removal should be divided as equally as possible between the different models within the unit. In combat, casualties should be removed from among the majority of the models that make up the fighting rank. In either case, available models are brought forward from rear ranks to fill any gaps, as chosen by the controlling player.</characteristic>
      </characteristics>
    </profile>
    <profile name="Move &amp; Shoot" hidden="false" id="6d4e-d525-ad86-4e4a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="174" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A weapon with this special rule can be used in the Shooting phase even if the model equipped with it marched this turn.</characteristic>
      </characteristics>
    </profile>
    <profile name="Rallying Cry" hidden="false" id="23c4-bd19-2422-ad08" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="175" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">During the command sub-phase of their turn, if they are nor engaged in combat, this character may nominate a single fleeing friendly unit that is within their Command range. The nominated unit immediately makes a Rally test. If the test is failed the unit may attempt to rally again as normal during the Rally sub-phase</characteristic>
      </characteristics>
    </profile>
    <profile name="Quick Shot" hidden="false" id="f733-b74b-6cb1-c69" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="175" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A weapon with this special rule does not suffer the usual -1 To Hit modifier for Moving and Shooting. In addition, a unit equipped with weapons with this special rule can use them to make a Stand &amp; Shoot charge reaction regardless of how close the charging unit is.</characteristic>
      </characteristics>
    </profile>
    <profile name="Ponderous" hidden="false" id="1170-9414-b4b5-a125" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="175" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A weapon with this special rule suffers a To Hit modifier of -2 for Moving and Shooting, rather than the usual -1.</characteristic>
      </characteristics>
    </profile>
    <profile name="Multiple Wounds" hidden="false" id="e3d3-a090-9e2-b276" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Each unsaved wound inflicted by an attack with this special rule is multiplied by the number shown in brackets after the name of this special rule (X). For example, Multiple Wounds (2) would mean that each unsaved wound would cause the target to lose two Wounds. Where the number of Multiple Wounds is generated by a dice roll, roll separately for each unsaved wound.

Note that excess wounds caused to a model will have no additional effect unless that model is a character, in which case this special rule counts for Overkill. Excess wounds do not &apos;spill over&apos; onto other models in the unit.</characteristic>
      </characteristics>
    </profile>
    <profile name="Move or Shoot" hidden="false" id="f384-89df-fa9b-1d33" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A weapon with this special rule cannot be used in the Shooting phase if the model equipped with it moved for any reason during this turn (including rallying and reforming).</characteristic>
      </characteristics>
    </profile>
    <profile name="Multiple Shots" hidden="false" id="11ef-2de2-ef4c-dc56" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A weapon with this special rule can either fire a single shot as normal, or it can be fired a number of times, as shown in brackets after the name of this special rule (X). If multiple shots are fired, each roll To Hit suffers an additional -1 To Hit modifier. All models in a unit equipped with weapons with this special rule must fire either a single or Multiple Shots. Where the number of Multiple Shots is generated by a dice roll, roll separately for each model.</characteristic>
      </characteristics>
    </profile>
    <profile name="Poisoned Attacks" hidden="false" id="81f5-4895-4abc-fc39" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="175" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a model with Poisoned Attacks rolls a natural 6 when making a roll To Hit, that hit will wound automatically. Unless otherwise stated, a model with this special rule may use it when making both shooting and combat attacks. Any spells cast by the model are unaffected, as are any attacks made with magic weapons.

Note that if an attack needs a To Hit roll of 7+, or hits automatically, this special rule cannot be used.</characteristic>
      </characteristics>
    </profile>
    <profile name="Random Attacks" hidden="false" id="1b08-4621-6379-ff1f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="176" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule do not have a normal Attacks characteristic. Instead, a dice roll is given (D3+1, for example). Each time a model with this special rule attacks in combat, roll a dice to determine the number of attacks it will make, then roll To Hit as normal. If a fighting rank contains mode than one model with this special rule, roll separately for each, unless specified otherwise.</characteristic>
      </characteristics>
    </profile>
    <profile name="Random Movement" hidden="false" id="4924-fc1f-bcd-746a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="176" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule move during the Compulsory Moves sub-phase. They cannot march or declare a charge. They can wheel to change direction, but cannot perform any other manoeuvres. If the model is able to make contact with an enemy unit during the Compulsory Moves sub-phase or whilst pursuing, it may do so and counts as having charged. The model aligns against the enemy unit and stops moving. A unit charged in this way must Hold.

If every model in a unit has this special rule, toll once for the entire unit. If two or more models in a unit have different Random Movement characteristics, roll for each and use the lowest result for the entire unit.</characteristic>
      </characteristics>
    </profile>
    <profile name="Regeneration" hidden="false" id="2eb0-1ec8-8e04-72d4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule can make a &apos;Regeneration&apos; save. The armour value of a Regeneration save is shown in brackets after the name of this special rule (X+). A Regeneration save can never be modified by the AP characteristic of a weapon and can be made in addition to an armour save and  Ward save. However, any wounds saved by a Regeneration save are still counted for the purposes of calculating combat result.

Note that models with this special rule are often vulnerable to the Flaming Attacks or Magical Attacks special rules.</characteristic>
      </characteristics>
    </profile>
    <profile name="Regimental Unit" hidden="false" id="7424-ec43-7581-965a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="176" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule can be accompanied by &apos;detachments&apos;.</characteristic>
      </characteristics>
    </profile>
    <profile name="Requires Two Hands" hidden="false" id="4f8d-35e-6be9-dabb" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="176" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model cannot use a shield alongside a weapon with this special rule during the Combat phase (a shield can still be used against wounds caused by shooting or magic during other phases of the game).</characteristic>
      </characteristics>
    </profile>
    <profile name="Reserve Move" hidden="false" id="1f10-d7d-be19-7e8f" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="177" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Unless is charged, marched or fled during the Movement phase of its turn, a unit with this special rule may make a Reserve move at the end of the Shooting phase of its turn, after all shooting has been resolved. A unit making a Reserve move moves as described in the Basic Movement rules. It may manoeuvre but cannot march.</characteristic>
      </characteristics>
    </profile>
    <profile name="Stomp Attacks" hidden="false" id="72db-24bb-7493-d753" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">The number of Stomp Attacks caused varies from model to model and will be shown in brackets after the name of this special rule (X). Often, this is determined by the roll of a dice.

Resolving Stomp Attacks: Stomp Attacks can only be made by a model that is in base contact with the enemy. Stomp Attacks are attacks made in combat that always strike at Initiative 1 (regardless of modifiers) and that hit automatically using the unmodified Strength characteristic of the model.</characteristic>
      </characteristics>
    </profile>
    <profile name="Strike First" hidden="false" id="48fd-23c1-c0d5-ae1d" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="177" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">During the Combat phase, a model with this special rile that is engaged in combat improves its Initiative characteristic to 10 (before any other modifiers are applied). If a model has both this rule and Strike Last, the two rules cancel each other out.</characteristic>
      </characteristics>
    </profile>
    <profile name="Strike Last" hidden="false" id="7c4d-72c1-eeb-ab5c" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="178" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">During the Combat phase a model with this special rule that is engaged in combat  reduces its Initiative characteristic to 1 (before any other modifiers are applied). If a model has both this rule and Strike First, the two rules cancel each other out.</characteristic>
      </characteristics>
    </profile>
    <profile name="Stupidity" hidden="false" id="f7af-e016-1f9c-54c0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="178" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Unless it is engaged in combat, a unit with this special rule must make a &apos;Stupidity&apos; test during the Start of Turn sub-phase of its turn. To make a Stupidity test, test against the unit&apos;s Leadership characteristic. If this test is failed the unit becomes Stupid. A Stupid unit:

- Moves during the Compulsory Moves sub-phase.
- Must move straight ahead, without performing any manoeuvres.
- Cannot march or declare a charge.

A unit or mount that does not have this special rule becomes subject to it when joined or ridden by a character that does (Stupidity is contagious).</characteristic>
      </characteristics>
    </profile>
    <profile name="Swiftstride" hidden="false" id="dc91-48b3-3696-217" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="178" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">???</characteristic>
      </characteristics>
    </profile>
    <profile name="Terror" hidden="false" id="c7a2-35bf-4313-f4f0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="179" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">Models with this special rule cause Terror. Models that cause Terror also cause Fear.

- When a unit that causes Terror declares a charge, the charge target must immediately make a Leadership test. If this test is failed, it must Flee. If this test is passed, it can declare its charge reaction normally.
- If the winning side of a combat includes one or more units that cause Terror, each unit that belongs to the losing side must apply a -1 modifier to its Leadership characteristic when making its Break test.

Note that if a charged unit cannot choose to Flee, it does not make this Leadership test.

Models with the Fear special rule Fear models that cause Terror. Models that cause Terror are immune to Terror. A unit that does not cause Terror does not become immune to Terror when joined by a character that does.</characteristic>
      </characteristics>
    </profile>
    <profile name="Timmm-berrr!" hidden="false" id="4f28-3f86-cf88-6b3a" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="179" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">When this model is reduced to zero Wounds, the winner of a roll-off choses one of its arcs(front, flank or rear) for it to fall into. Army units that are within the chosen arc and in base contact with this model suffer D6 hits, each using the Strength characteristic of this model with an AP of -1. Once these hits are resolved, this model is removed from play.</characteristic>
      </characteristics>
    </profile>
    <profile name="Unbreakable" hidden="false" id="d3eb-1fa0-bb19-f390" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="179" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">If a unit with this special rile loses a round of combat, it is not required to make a Break test. Instead, it will automatically Give Ground as it is pushed back by the enemy. Characters that are not Unbreakable cannot join units that are, and vice versa.</characteristic>
      </characteristics>
    </profile>
    <profile name="Warp-spawned" hidden="false" id="c24d-4386-c1ef-f195" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A model with this special rule cannot make a Regeneration save against a wound caused by a Magical attack. In addition, characters that are not Warp-spawned cannot join a unit that are, and vice versa.</characteristic>
      </characteristics>
    </profile>
    <profile name="Volley Fire" hidden="false" id="330c-821e-8fe0-d4ae" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">When a unit with this special rile makes a shooting attack, half of the models in each rank other than the front rank (or front two ranks if the unit is on a hill), rounding up, can shoot (in addition to the usual models that shoot from the front rank, or front two ranks if the unit is on a hill). A unit cannot Volley Fire if it has moved for any reason during this turn (including reforming), or when making a Stand &amp; Shoot charge reaction.

Note that models in rear ranks use the line of sight of the model at the front of their file.</characteristic>
      </characteristics>
    </profile>
    <profile name="Unstable" hidden="false" id="a10e-13b7-e959-ab5" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="180" publicationId="768b-3da1-a182-a1d8">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">??????</characteristic>
      </characteristics>
    </profile>
    <profile name="Standard Bearer" hidden="false" id="bcf8-d942-102e-b155" typeId="52d4-d959-fe4d-90fa" typeName="Command">
      <characteristics>
        <characteristic name="Description" typeId="441a-ef3a-c07e-95f"/>
      </characteristics>
    </profile>
    <profile name="Musician" hidden="false" id="40f2-dd77-f0ca-3663" typeId="52d4-d959-fe4d-90fa" typeName="Command">
      <characteristics>
        <characteristic name="Description" typeId="441a-ef3a-c07e-95f"/>
      </characteristics>
    </profile>
    <profile name="Champion" hidden="false" id="5f1c-fd04-b0d5-d5e" typeId="52d4-d959-fe4d-90fa" typeName="Command">
      <characteristics>
        <characteristic name="Description" typeId="441a-ef3a-c07e-95f"/>
      </characteristics>
    </profile>
    <profile name="Base (50x50)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="7813-4d15-143d-1bf1">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">50x50</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (40x60)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="edea-5f38-530a-57f1">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">40x60</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (25x50)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="2d9f-e535-9b2e-ca11">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">25x50</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (40x40)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="1b54-27fc-b510-61b8">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">40x40</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (50x75)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="2b6f-489f-3c3c-bf7c">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">50x75</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (50x100)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="d456-e30e-f85d-14d">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">50x100</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (60x100)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="5125-89a4-916a-eabd">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">60x100</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Base (100x150)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="a35e-8f23-b67-1efe">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">100x150</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Bolt Thrower" hidden="false" id="36e4-28b4-31ff-39dc" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">48&quot; S6 AP-3 Cumbersome, Move or Shoot, Multiple Wounds (2), Through or Through</characteristic>
      </characteristics>
    </profile>
    <profile name="Cannon" hidden="false" id="8ef5-8512-e1c2-6474" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">48&quot; S8 AP-2 Armour Bane(2), Cannon Fire, Cumbersome, Move or Shoot, Multiple Wounds (D3)</characteristic>
      </characteristics>
    </profile>
    <profile name="Stone Thrower" hidden="false" id="3142-ada8-328d-1615" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12-60&quot; S4(8) AP-1(-3) Bombardment, Cumbersome, Move or Shoot, Multiple Wounds (D3+1)</characteristic>
      </characteristics>
    </profile>
    <profile name="Organ Gun" hidden="false" id="5635-efd8-13b6-c841" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">30&quot; S5 AP-1 Armour Bane(2), Cumbersome, Move or Shoot, Multi-Barrelled</characteristic>
      </characteristics>
    </profile>
    <profile name="Fire Thrower" hidden="false" id="2694-34f1-f146-6351" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S5 AP-1  Column of Fire, Cumbersome, Flaming Attack, Move or Shoot</characteristic>
      </characteristics>
    </profile>
    <profile name="Javelin" hidden="false" id="f3f8-7476-d165-1a5d" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S Move &amp; Shoot, Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Cavalry Spear" hidden="false" id="ee75-c1a8-2f0c-c264" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+1 AP-1 Fight in Extra Rank. Models which troop type is &apos;cavalry&apos; or &apos;monster&apos; only. A cavalry&apos;s spear Strength and Armor Piercing modifiers apply only during a turn in which the wielder charged. A model wielding a cavalry spear cannot make a supporting attack during a turn in which it charged.</characteristic>
      </characteristics>
    </profile>
    <profile name="Morning Star" hidden="false" id="caad-2fc0-e82a-18fd" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+1 AP-1 A morning star&apos;s Strength modifier applies only during the first round of combat.</characteristic>
      </characteristics>
    </profile>
    <profile name="Halberd" hidden="false" id="98f8-9d8-94cd-3379" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+1 AP-1 Armour Bane (1), Requires Two Hands</characteristic>
      </characteristics>
    </profile>
    <profile name="Flail" hidden="false" id="b326-5bf3-9b4e-f8ad" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+2 AP-2 Requires Two Hands, A flail&apos;s Strength modifier applies only during the first round of combat.</characteristic>
      </characteristics>
    </profile>
    <profile name="Whip" hidden="false" id="7505-7edf-c3de-57a6" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Fight in Extra Rank, Strike First</characteristic>
      </characteristics>
    </profile>
    <profile name="Lance" hidden="false" id="3520-64c9-a855-ce9e" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">S+2 AP-2 Armour Bane (1) Models which troop type is &apos;cavalry&apos; or &apos;monster&apos; only. A lance can only be used during a turn in which the wielder charged. In subsequent turns (or if the wielder did not charge) the model must use its hand weapon instead.</characteristic>
      </characteristics>
    </profile>
    <profile name="Shortbow" hidden="false" id="1b65-71ef-52a3-93d0" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">18&quot; S3 Quick Shot, Volley Fire</characteristic>
      </characteristics>
    </profile>
    <profile name="Warbow" hidden="false" id="4ba0-4ae4-3ac2-a173" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">24&quot; S3 Volley Fire</characteristic>
      </characteristics>
    </profile>
    <profile name="Repeater Pistol" hidden="false" id="f675-db0d-397c-d873" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S4 AP-1 Armour Bane (1), Multiple Shots (3), Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Repeater Handgun" hidden="false" id="7f58-91d4-ee6c-3cb7" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">24&quot; S4 AP-1 Armour Bane (1), Multiple Shots (3), Ponderous</characteristic>
      </characteristics>
    </profile>
    <profile name="Crossbow" hidden="false" id="1ef1-8579-c310-4fb5" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">30&quot; S4 Armour Bane (2), Ponderous</characteristic>
      </characteristics>
    </profile>
    <profile name="Repeater Crossbow" hidden="false" id="e240-f607-2c57-b181" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">24&quot; S3 Armour Bane (1), Multiple Shots (2)</characteristic>
      </characteristics>
    </profile>
    <profile name="Repeater Handbow" hidden="false" id="f187-983f-99f2-5ecd" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12&quot; S3 Multiple Shots (2), Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Two Hand Weapon" hidden="false" id="1f58-a56f-e54c-ddc5" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Extra Atacks (+1), Require Two Hands</characteristic>
      </characteristics>
    </profile>
    <profile name="Sling" hidden="false" id="eee6-7b1-58de-6ad2" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">18&quot; S3 Multiple Shots (2)</characteristic>
      </characteristics>
    </profile>
    <profile name="Throwing Axe" hidden="false" id="9914-73b6-65c4-ec44" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">9&quot; S+1 Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Throwing Weapon" hidden="false" id="eee5-db12-1271-f2c5" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">9&quot; S Multiple Shots (2), Move &amp; Shoot, Quick Shot</characteristic>
      </characteristics>
    </profile>
    <profile name="Wicked Claws" hidden="false" id="14c0-c7a7-dd09-ea49" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">AP-2</characteristic>
      </characteristics>
    </profile>
    <profile name="Serrated Maw" hidden="false" id="2dea-8d5a-633c-cd7d" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">Armour Bane(2), Multiple Wounds(2)</characteristic>
      </characteristics>
    </profile>
    <profile name="Base (round 50)" hidden="false" id="2c87-b5d6-e13b-4082" typeId="1ae4-7f34-4055-fd5f" typeName="Base">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">50</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Mortar" hidden="false" id="11c5-c8bc-6ce3-8932" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">12-48&quot; S2(6) AP-2(-3) Armour Bane (1), Bombardment, Cumbersome, Move or Shoot, Multiple Wounds (D3)</characteristic>
      </characteristics>
    </profile>
    <profile name="Base (75x50)" typeId="1ae4-7f34-4055-fd5f" typeName="Base" hidden="false" id="f4be-ad24-1cc9-a6ac">
      <characteristics>
        <characteristic name="Base Size" typeId="1adf-d238-57ca-2226">75x50</characteristic>
      </characteristics>
      <modifiers>
        <modifier type="set" value="Base" field="name"/>
      </modifiers>
    </profile>
    <profile name="Flame Cannon" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon" hidden="false" id="5207-3185-698f-a161">
      <characteristics>
        <characteristic name="Description" typeId="47f2-ecee-cae0-9ef9">description of flame cannon</characteristic>
      </characteristics>
    </profile>
    <profile name="General" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" hidden="false" id="609a-2943-a6e1-e002">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">the general...</characteristic>
      </characteristics>
    </profile>
    <profile name="Wizard Level 1" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" hidden="false" id="c3c-9624-c39-e86a">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">???</characteristic>
      </characteristics>
    </profile>
    <profile name="Wizard Level 2" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" hidden="false" id="f40c-d76a-fd42-fb9a">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">???</characteristic>
      </characteristics>
    </profile>
    <profile name="Wizard Level 3" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" hidden="false" id="1acd-4208-ba07-175b">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">???</characteristic>
      </characteristics>
    </profile>
    <profile name="Wizard Level 4" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" hidden="false" id="5cee-9c31-3cc4-5c9f">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">???</characteristic>
      </characteristics>
    </profile>
    <profile name="Nehekharan Phalanx" hidden="false" id="a527-88cc-ddd6-1ea0" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule" page="154" publicationId="7c89-736c-3139-24a0">
      <characteristics>
        <characteristic name="Description" typeId="9f84-4221-785a-db50">A unit with this special rule that is arrayed in a Close Order formation, and that is equipped with and chooses to use shields, may choose not to Give Ground Should it lose a round in combat. However, if the winning side significantly outnumbers the losing side, it will overwhelm the loser. If the Unit Strength of the winning side is more than twice that of the losing side, the unit cannot use this special rule and must Give Ground as normal.</characteristic>
      </characteristics>
    </profile>
  </sharedProfiles>
  <sharedSelectionEntries>
    <selectionEntry type="upgrade" import="true" name="Hand Weapon" hidden="false" id="721d-36e3-388a-c0d6" collective="true">
      <infoLinks>
        <infoLink name="Hand Weapon" hidden="false" type="profile" id="c4fd-6287-4ab1-bb65" targetId="ef45-edcd-18bf-fe1d"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ca7e-349b-d258-ef9d"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Great Weapon" hidden="false" id="2283-26e9-76c3-6048" collective="true">
      <infoLinks>
        <infoLink name="Great Weapon" hidden="false" type="profile" id="4465-7e60-819e-a74f" targetId="88e3-38f0-92d5-b616"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6e03-7cfb-4459-9b9a-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Shield" hidden="false" id="6192-f9f1-5d53-2042" collective="true">
      <infoLinks>
        <infoLink name="Shield" hidden="false" type="profile" id="5300-a336-be3f-860e" targetId="8997-c74d-3a8d-ecf9"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="790c-164-ceb-9758"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Lance" hidden="true" id="906a-c09d-9f34-a31f" collective="true">
      <infoLinks>
        <infoLink name="Lance" hidden="false" type="profile" id="4bb4-37af-dd08-93dd" targetId="3520-64c9-a855-ce9e"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="43c1-42a1-9a0a-326e-max"/>
      </constraints>
      <modifiers>
        <modifier type="set" value="false" field="hidden">
          <conditions>
            <condition type="atLeast" value="1" field="selections" scope="parent" childId="mount" shared="true"/>
          </conditions>
        </modifier>
      </modifiers>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Heavy Armour" hidden="false" id="62fb-f89d-afc-1cf1" collective="true">
      <infoLinks>
        <infoLink name="Heavy Armour" hidden="false" type="profile" id="38dd-cfd4-ea64-fa1b" targetId="c56e-8d1b-bb4-de99"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="45e-be05-779d-ba20-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Barding" hidden="false" id="718d-9fe8-f8ad-ad3c" collective="true">
      <infoLinks>
        <infoLink name="Barding" hidden="false" type="profile" id="eaf9-36e4-c4fb-f18c" targetId="eb5d-bd8a-c75c-66d7"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4973-bc30-67f5-cb08-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Crossbow" hidden="false" id="c3af-77b3-b2d5-20db" collective="true">
      <infoLinks>
        <infoLink name="Crossbow" hidden="false" type="profile" id="5eba-daec-5c9f-719b" targetId="1ef1-8579-c310-4fb5"/>
      </infoLinks>
      <constraints>
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
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e78c-1462-8bdf-29fd"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Handgun" hidden="false" id="e2ed-a3fd-dee5-3e9f" collective="true">
      <infoLinks>
        <infoLink name="Handgun" hidden="false" type="profile" id="53c8-39c-1947-edf7" targetId="4035-287b-e117-6b9b"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4d0a-3a4a-44b7-6d6"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Light Armour" hidden="false" id="7cab-40e6-f134-de78" collective="true">
      <infoLinks>
        <infoLink name="Light Armour" hidden="false" type="profile" id="95b2-9d59-c3c8-393b" targetId="dbb2-4d85-84c2-528c"/>
      </infoLinks>
      <constraints>
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
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="bb24-f518-d872-575c-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Bolt Thrower" hidden="false" id="eace-1222-ef64-e030" collective="true">
      <infoLinks>
        <infoLink name="Bolt Thrower" hidden="false" type="profile" id="3f4-cc6e-a6e8-be2" targetId="36e4-28b4-31ff-39dc"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8718-287f-7f31-316d"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Cannon" hidden="false" id="ca63-2c16-928e-1e45" collective="true">
      <infoLinks>
        <infoLink name="Cannon" hidden="false" type="profile" id="3e4c-9708-eee8-14cd" targetId="8ef5-8512-e1c2-6474"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ae72-ea17-e2b-8ca6"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Organ Gun" hidden="false" id="e690-7263-fa52-7192" collective="true">
      <infoLinks>
        <infoLink name="Organ Gun" hidden="false" type="profile" id="93f0-c7ec-3e3-360e" targetId="5635-efd8-13b6-c841"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="df7e-515b-6c02-41c0"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Stone Thrower" hidden="false" id="365a-2626-2fb2-3a69" collective="true">
      <infoLinks>
        <infoLink name="Stone Thrower" hidden="false" type="profile" id="a8ac-b1de-da49-351" targetId="3142-ada8-328d-1615"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6e6a-f8b9-767b-e92c"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Fire Thrower" hidden="false" id="75a5-87ec-2be6-6adb" collective="true">
      <infoLinks>
        <infoLink name="Fire Thrower" hidden="false" type="profile" id="4c01-ea2c-2a89-b87b" targetId="2694-34f1-f146-6351"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="890b-e8c0-76c1-6024"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Repeater Crossbow" hidden="false" id="40ad-23e9-f0c7-4c15" collective="true">
      <infoLinks>
        <infoLink name="Repeater Crossbow" hidden="false" type="profile" id="90ea-8330-2e5a-5af9" targetId="e240-f607-2c57-b181"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a3fd-a9c9-b05d-acf"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Longbow" hidden="false" id="c0e5-968b-c467-56ba" collective="true">
      <infoLinks>
        <infoLink name="Longbow" hidden="false" type="profile" id="90a9-4cb0-3fe3-caa" targetId="c84c-99b6-75eb-4f40"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="333a-deff-559d-c446"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Shortbow" hidden="false" id="f187-20d4-41f3-63cc" collective="true">
      <infoLinks>
        <infoLink name="Shortbow" hidden="false" type="profile" id="bf02-c24f-a557-1323" targetId="1b65-71ef-52a3-93d0"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7efc-2607-1899-ffd5"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Two Hand Weapon" hidden="false" id="a5bd-e584-3c96-550f" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cf5f-459a-36b3-81a4"/>
      </constraints>
      <infoLinks>
        <infoLink name="Two Hand Weapon" hidden="false" type="profile" id="1914-5906-5a1a-2ec5" targetId="1f58-a56f-e54c-ddc5"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Flail" hidden="false" id="308a-2562-9266-2151" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a677-3b60-ae2b-abf1"/>
      </constraints>
      <infoLinks>
        <infoLink name="Flail" hidden="false" type="profile" id="d1df-59f0-b409-f6b3" targetId="b326-5bf3-9b4e-f8ad"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Halberd" hidden="false" id="f0a5-1b2e-3d2b-d540" collective="true">
      <infoLinks>
        <infoLink name="Halberd" hidden="false" type="profile" id="4a05-1d6f-d6ae-cbd4" targetId="98f8-9d8-94cd-3379"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="c8c1-1e74-a2de-b637"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Morning Star" hidden="false" id="7408-2024-917-7f11" collective="true">
      <infoLinks>
        <infoLink name="Morning Star" hidden="false" type="profile" id="e93d-cd2f-69d2-6fda" targetId="caad-2fc0-e82a-18fd"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7b10-be97-2cf2-6271"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Whip" hidden="false" id="4619-3a0d-3a3c-27af" collective="true">
      <infoLinks>
        <infoLink name="Whip" hidden="false" type="profile" id="5abd-ceb0-f68c-9111" targetId="7505-7edf-c3de-57a6"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Cavalry Spear" hidden="true" id="a2d0-40e9-83ad-23dc" collective="true">
      <infoLinks>
        <infoLink name="Cavalry Spear" hidden="false" type="profile" id="e62-14df-8b5f-255c" targetId="ee75-c1a8-2f0c-c264"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e98e-d127-3c6f-9935"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Repeater Handgun" hidden="false" id="1748-87d-961c-9278">
      <infoLinks>
        <infoLink name="Repeater Handgun" hidden="false" type="profile" id="4d44-a8-e692-4d40" targetId="7f58-91d4-ee6c-3cb7"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2cda-64ce-b498-7429"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Repeater Pistol" hidden="false" id="6d12-5625-aef5-e25d">
      <infoLinks>
        <infoLink name="Repeater Pistol" hidden="false" type="profile" id="d6c2-8220-bca4-c141" targetId="f675-db0d-397c-d873"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7b22-afdc-1c29-745c"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Brace of Repeater Handbows" hidden="false" id="9f47-81ce-2112-83e1" collective="true">
      <infoLinks>
        <infoLink name="Crossbow" hidden="false" type="profile" id="dc96-7ebd-c388-3fda" targetId="fca0-3c32-72da-53b9"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="bebc-8aba-b2a3-e7a8"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Repeater Handbow" hidden="false" id="4f02-c0c2-a8f7-1672" collective="true">
      <infoLinks>
        <infoLink name="Repeater Handbow" hidden="false" type="profile" id="463-758b-a4dd-f4de" targetId="f187-983f-99f2-5ecd"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="32d-bf74-9c21-f919"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Sling" hidden="false" id="d477-7d43-aa1b-5418" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8bde-982b-2ff6-e384"/>
      </constraints>
      <infoLinks>
        <infoLink name="Sling" hidden="false" type="profile" id="3a06-5a9d-48d7-772c" targetId="eee6-7b1-58de-6ad2"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Throwing Weapon" hidden="false" id="9acb-1a87-176-5a2f" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6a65-c8b6-bdec-5ca3"/>
      </constraints>
      <infoLinks>
        <infoLink name="Throwing Weapon" hidden="false" type="profile" id="1324-31d9-ec77-6d2" targetId="eee5-db12-1271-f2c5"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Javelin" hidden="false" id="e1f2-f9a2-c311-123c" collective="true">
      <infoLinks>
        <infoLink name="Javelin" hidden="false" type="profile" id="db1b-f777-1f1e-5546" targetId="f3f8-7476-d165-1a5d"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Throwing Axe" hidden="false" id="ac7b-2b4f-83e-b527" collective="true">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="45f1-5aeb-11f3-d308"/>
      </constraints>
      <infoLinks>
        <infoLink name="Throwing Axe" hidden="false" type="profile" id="bba9-3a55-ccf0-df33" targetId="9914-73b6-65c4-ec44"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Wicked Claws" hidden="false" id="7414-cec3-7cd7-a94b" collective="true">
      <infoLinks>
        <infoLink name="Wicked Claws" hidden="false" type="profile" id="4e04-9a9d-41d7-3e12" targetId="14c0-c7a7-dd09-ea49"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f1e2-76b3-2728-2664"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Serrated Maw" hidden="false" id="1e93-bd5f-4eab-4521" collective="false">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="84e1-3194-eb8f-824c"/>
      </constraints>
      <infoLinks>
        <infoLink name="Serrated Maw" hidden="false" type="profile" id="145d-7d5f-52ce-e69f" targetId="2dea-8d5a-633c-cd7d"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Mortar" hidden="false" id="b4ec-f8f5-83b4-5cd8" collective="true">
      <infoLinks>
        <infoLink name="Mortar" hidden="false" type="profile" id="e0aa-bc2b-9600-b9bf" targetId="11c5-c8bc-6ce3-8932"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="74ca-7660-ed4a-7cd6"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Flame Cannon" hidden="false" id="b7b6-5993-feab-cc81">
      <infoLinks>
        <infoLink name="Flame Cannon" hidden="false" type="profile" id="526b-6831-ddf-b22d" targetId="5207-3185-698f-a161"/>
      </infoLinks>
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="a9af-9404-4702-ee53-max"/>
      </constraints>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="General" hidden="false" id="7d76-b1a1-1535-a04c">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="d7d2-b39d-2dc7-e2a0"/>
      </constraints>
      <infoLinks>
        <infoLink name="General" hidden="false" type="profile" id="32de-47ba-5fe9-7fb6" targetId="609a-2943-a6e1-e002"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Wizard Level 1" hidden="false" id="7d84-39e9-a5f-947e">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="7888-6128-a030-93db"/>
      </constraints>
      <infoLinks>
        <infoLink name="Wizard Level 1" hidden="false" type="profile" id="fd84-35e9-15db-2670" targetId="c3c-9624-c39-e86a"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Wizard Level 2" hidden="false" id="8e47-73e8-f7f9-808">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="66da-479a-dbd-e647"/>
      </constraints>
      <infoLinks>
        <infoLink name="Wizard Level 2" hidden="false" type="profile" id="683-c3d4-4dd-5e83" targetId="f40c-d76a-fd42-fb9a"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Wizard Level 3" hidden="false" id="59f1-ac46-8123-3f8d">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="e89-9137-1448-c6a6"/>
      </constraints>
      <infoLinks>
        <infoLink name="Wizard Level 3" hidden="false" type="profile" id="5128-eda0-c7a5-7933" targetId="1acd-4208-ba07-175b"/>
      </infoLinks>
    </selectionEntry>
    <selectionEntry type="upgrade" import="true" name="Wizard Level 4" hidden="false" id="50bd-b918-574a-60c3">
      <constraints>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8eac-d4f1-b008-4cc"/>
      </constraints>
      <infoLinks>
        <infoLink name="Wizard Level 4" hidden="false" type="profile" id="4cf7-4c87-381e-e310" targetId="5cee-9c31-3cc4-5c9f"/>
      </infoLinks>
    </selectionEntry>
  </sharedSelectionEntries>
  <readme>Battlescribe is abandonware, go to www.newrecruit.eu for a much better alternative!</readme>
  <sharedSelectionEntryGroups>
    <selectionEntryGroup name="Unit Options" hidden="false" id="ce2e-bc0f-be9b-9221">
      <selectionEntries>
        <selectionEntry type="upgrade" import="true" name="Drilled" hidden="true" id="35f8-72c5-b312-754d" sortIndex="3">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="324b-28f9-b5cc-86c3"/>
          </constraints>
          <infoLinks>
            <infoLink name="Drilled" hidden="false" type="profile" id="7560-2384-e11b-4b6a" targetId="1f64-3ddc-db58-12fb"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="f5b8-4493-5ca9-6a2" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="7913-acb6-d065-2dab" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Veterans" hidden="true" id="b7b9-99f2-db6b-4c88" sortIndex="4">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="97f2-8a18-1df2-7e82"/>
          </constraints>
          <infoLinks>
            <infoLink name="Veteran" hidden="false" type="profile" id="8826-bf00-e432-f316" targetId="4022-c403-b083-ba83"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="925c-b77-1d36-e3bf" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="7c68-4965-48a1-29ed"/>
              </repeats>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Magic Standard" hidden="true" id="baa-a804-e903-a730" sortIndex="1">
          <categoryLinks>
            <categoryLink targetId="49a9-ce63-af1a-18f7" id="991f-2df3-7a32-dd1f" primary="false" name="NO EXPORT"/>
          </categoryLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="601a-2cc-22b3-2d51"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="caab-4ac8-e0ba-d843" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="set" value="Standard Runes" field="name">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="primary-catalogue" childId="1ddf-26c6-1d88-2b8c" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Open Order" hidden="true" id="9e79-880e-3a51-835e" sortIndex="5">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cb8f-b04d-5224-d107"/>
          </constraints>
          <infoLinks>
            <infoLink name="Open Order" hidden="false" type="profile" id="1e8c-a401-44b8-ddf4" targetId="5b67-8535-146c-7cea"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="c2e6-2e17-855-2eb3" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Vanguard" hidden="true" id="dd26-3f98-d12c-3b31" sortIndex="19">
          <infoLinks>
            <infoLink name="Vanguard" hidden="false" type="profile" id="d511-698c-458b-7389" targetId="691e-10ec-4f7c-a2c4"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8402-e52b-af31-2eed"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="871f-ae50-ed04-428a" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="2"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Counter Charge" hidden="true" id="4559-746e-4b60-16de" sortIndex="9">
          <infoLinks>
            <infoLink name="Counter Charge" hidden="false" type="profile" id="dc93-9a69-d417-edd4" targetId="5186-798d-69d-6545"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="ca63-b2ad-9687-de5a"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="b248-98ef-5ad0-5b20" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Fire and Flee" hidden="true" id="d9c5-39fe-3737-e03" sortIndex="10">
          <infoLinks>
            <infoLink name="Fire &amp; Flee" hidden="false" type="profile" id="2864-4bdd-8a95-2309" targetId="1a06-31aa-cbfe-1a5"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6e6a-8265-9907-fd53"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="2661-a58f-ff4f-20cb" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Stubborn" hidden="true" id="bae9-43d9-f739-2ba6" sortIndex="20">
          <costs>
            <cost name="pts" typeId="points" value="2"/>
          </costs>
          <infoLinks>
            <infoLink name="Stubborn" hidden="false" type="profile" id="68fc-a4a7-b7f6-7781" targetId="e351-bbd6-f470-b604"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6e47-3d8-cc76-3f1f"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="2392-f089-8a93-dfc3" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Veterans" hidden="true" id="69bb-d3c5-3a21-dd06" sortIndex="11">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="1be3-e3de-8b34-5fd9"/>
          </constraints>
          <infoLinks>
            <infoLink name="Veteran" hidden="false" type="profile" id="9146-bf20-d9de-40a7" targetId="4022-c403-b083-ba83"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="e35d-fb38-21b-1a66" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="6d13-6e03-d408-4f3c"/>
              </repeats>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Scouts" hidden="true" id="9dd8-fa2-ae00-51f" sortIndex="21">
          <infoLinks>
            <infoLink name="Scouts" hidden="false" type="profile" id="39e0-ad51-10e-224f" targetId="fe5e-8838-7fbd-a7ec"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="4540-1b50-575f-2838"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="a2e3-9206-f023-b4c8" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="2"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Ambushers" hidden="true" id="e713-c9bb-54d1-90ae" sortIndex="12">
          <infoLinks>
            <infoLink name="Ambushers" hidden="false" type="profile" id="2954-578d-b9c2-496f" targetId="8c0b-6fe6-dc06-512"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cd24-3783-4289-53bf"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="144e-409-8908-7fce" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Vanguard" hidden="true" id="6807-4b87-934e-c752" sortIndex="13">
          <infoLinks>
            <infoLink name="Vanguard" hidden="false" type="profile" id="7bb5-9ec1-c8d5-3c5" targetId="691e-10ec-4f7c-a2c4"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8f7f-f87-1a0e-dc9e"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="1008-a8fa-67f7-3e39" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Stubborn" hidden="true" id="f51d-f3ff-17b7-1588" sortIndex="14">
          <infoLinks>
            <infoLink name="Stubborn" hidden="false" type="profile" id="3cb3-306c-f53b-8253" targetId="e351-bbd6-f470-b604"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="533f-139a-fbb4-477f"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="2392-f089-8a93-dfc3" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Frenzy" hidden="true" id="3711-b22a-2fd-22ca" sortIndex="15">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="54e5-8fe1-354b-a4ff"/>
          </constraints>
          <infoLinks>
            <infoLink name="Frenzy" hidden="false" type="profile" id="d693-55c7-1f61-623c" targetId="3b0c-a477-8823-3a25"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="fb51-7143-69de-c7fa" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="b442-ef51-d930-9987" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Nehekharan Phalanx" hidden="true" id="22e9-574d-c2bd-9279" sortIndex="16">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="cafc-2e9c-44a4-34ad"/>
          </constraints>
          <infoLinks>
            <infoLink name="Nehekharan Phalanx" hidden="false" type="profile" id="7e8e-4969-4c57-f6bb" targetId="a527-88cc-ddd6-1ea0"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="c008-2eab-5394-1224" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="f444-a14e-7ae8-57db" includeChildSelections="true"/>
              </repeats>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Skirmishers" hidden="true" id="6cad-49c3-6ea7-4add" sortIndex="17">
          <infoLinks>
            <infoLink name="Skirmishers" hidden="false" type="profile" id="561e-4ca6-df12-c4a6" targetId="59a5-7eca-ee35-96ac"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8700-de53-6f2d-6f61"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="9c9-dc8b-eb73-d90b" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Drilled" hidden="true" id="a60a-9db3-5719-4a09" sortIndex="18">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="999-6c4f-13e0-d14e"/>
          </constraints>
          <infoLinks>
            <infoLink name="Drilled" hidden="false" type="profile" id="fa3b-8405-61e-44a1" targetId="1f64-3ddc-db58-12fb"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="cb2-af12-ccbf-a2ec" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="ca73-6522-eb84-b481" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="1"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Skirmishers" hidden="true" id="734e-c065-8b35-e514" sortIndex="6">
          <infoLinks>
            <infoLink name="Skirmishers" hidden="false" type="profile" id="1d5d-a341-e252-a925" targetId="59a5-7eca-ee35-96ac"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="f094-1b2e-627b-2f06"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="5deb-f246-715f-2a08" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Feigned Flight" hidden="true" id="5dc9-bf8a-241b-6958" sortIndex="7">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="febd-b5d0-49c2-2648"/>
          </constraints>
          <infoLinks>
            <infoLink name="Feigned Flight" hidden="false" type="profile" id="39f4-a8bd-f950-7506" targetId="eea7-89d9-a996-403c"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="b6b1-37fc-a1ec-3464" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="b0ef-c009-a5d8-5d15"/>
              </repeats>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Reserve Move" hidden="true" id="5240-54c0-f880-91d7" sortIndex="8">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="8568-6aca-abba-e353"/>
          </constraints>
          <infoLinks>
            <infoLink name="Reserve Move" hidden="false" type="profile" id="481e-be46-6241-b749" targetId="1f10-d7d-be19-7e8f"/>
          </infoLinks>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="8b11-b8bd-b9fc-7459" shared="true"/>
              </conditions>
            </modifier>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="611a-af4f-1c90-e012"/>
              </repeats>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="0"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Frenzy" hidden="true" id="f04b-6597-be1a-d61b" sortIndex="22">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="75d1-3dbf-2757-c46c"/>
          </constraints>
          <infoLinks>
            <infoLink name="Frenzy" hidden="false" type="profile" id="e4ab-765f-abeb-ed3c" targetId="3b0c-a477-8823-3a25"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="5ad2-4224-5184-2e0f" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="a708-6cc7-6c0f-ad82" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="2"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Ambushers" hidden="true" id="efb8-a232-d3f0-7671" sortIndex="24">
          <infoLinks>
            <infoLink name="Ambushers" hidden="false" type="profile" id="28f8-83d6-f68f-efbc" targetId="8c0b-6fe6-dc06-512"/>
          </infoLinks>
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="81b2-99e1-5f9d-f710"/>
          </constraints>
          <modifiers>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="c86a-7a74-e1c8-95a7" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="10"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Frenzy" hidden="true" id="d11e-d8d3-4cf5-c14f" sortIndex="23">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="84b5-d675-b64e-aca7"/>
          </constraints>
          <infoLinks>
            <infoLink name="Frenzy" hidden="false" type="profile" id="b505-b7a0-637a-e937" targetId="3b0c-a477-8823-3a25"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="9db8-61c8-fce1-aa4b" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="4e48-1ecf-d4c5-ef0a" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
          <costs>
            <cost name="pts" typeId="points" value="3"/>
          </costs>
        </selectionEntry>
        <selectionEntry type="upgrade" import="true" name="Frenzy" hidden="true" id="97e-54c7-d200-4de7" sortIndex="2">
          <constraints>
            <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="6d52-2a89-bd62-143f"/>
          </constraints>
          <infoLinks>
            <infoLink name="Frenzy" hidden="false" type="profile" id="929d-e1a9-9e80-e453" targetId="3b0c-a477-8823-3a25"/>
          </infoLinks>
          <modifiers>
            <modifier type="increment" value="1" field="points">
              <repeats>
                <repeat value="1" repeats="1" field="selections" scope="parent" childId="model" shared="true" roundUp="false" id="c5f3-179a-5ad3-cf03" includeChildSelections="true"/>
              </repeats>
            </modifier>
            <modifier type="set" value="false" field="hidden">
              <conditions>
                <condition type="instanceOf" value="1" field="selections" scope="parent" childId="e41e-3817-ab1e-3b59" shared="true"/>
              </conditions>
            </modifier>
          </modifiers>
        </selectionEntry>
      </selectionEntries>
      <constraints>
        <constraint type="max" value="0" field="selections" scope="roster" shared="true" id="3d01-64be-78c5-3fff" includeChildSelections="true"/>
      </constraints>
      <modifiers>
        <modifier type="increment" value="1" field="3d01-64be-78c5-3fff">
          <repeats>
            <repeat value="1000" repeats="1" field="limit::points" scope="roster" shared="true" roundUp="false" id="cc5a-af60-a1c7-b52d" childId="any" includeChildSelections="true"/>
          </repeats>
        </modifier>
      </modifiers>
    </selectionEntryGroup>
  </sharedSelectionEntryGroups>
  <publications>
    <publication name="Core Rulebook" hidden="false" id="768b-3da1-a182-a1d8"/>
    <publication name="Forces of Fantasy" hidden="false" id="8b8d-8fc4-559e-87b1"/>
    <publication name="Ravening Hordes" hidden="false" id="7c89-736c-3139-24a0"/>
  </publications>
</gameSystem>
