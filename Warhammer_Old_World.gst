<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gameSystem id="sys-31d1-bf57-53ea-ad55" name="Warhammer The Old World" battleScribeVersion="2.03" revision="17" type="gameSystem" xmlns="http://www.battlescribe.net/schema/gameSystemSchema" library="true">
  <categoryEntries>
    <categoryEntry name="Characters" hidden="false" id="a4cc-15c9-cfae-1b3b"/>
    <categoryEntry id="f0e3-2e32-8866-ea32" name="Core"/>
    <categoryEntry name="Special" hidden="false" id="633f-f67a-1b6a-d203"/>
    <categoryEntry name="Rare" hidden="false" id="2bfe-5863-46fe-d284"/>
    <categoryEntry name="Mercenaries" hidden="false" id="5b84-2c3c-869d-3522"/>
    <categoryEntry name="CHAMPION" hidden="true" id="83a1-945c-564c-84af"/>
    <categoryEntry name="Infantry" hidden="false" id="f3f7-ca43-674e-115f"/>
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
      </characteristics>
    </profile>
    <profile name="Close Order" hidden="false" id="883e-e1b1-4fe9-5912" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Close Orders description</characteristic>
      </characteristics>
    </profile>
    <profile name="Crossbow" hidden="false" id="fca0-3c32-72da-53b9" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Crossbow desc...</characteristic>
      </characteristics>
    </profile>
    <profile name="Spear" hidden="false" id="a344-4142-98e7-c06b" typeId="cc88-6a7d-41c9-d63e" typeName="Weapon">
      <characteristics>
        <characteristic name="Weapon" typeId="47f2-ecee-cae0-9ef9">Fight on 1 extra rank</characteristic>
      </characteristics>
    </profile>
    <profile name="Hatred" hidden="false" id="f4b3-18af-16bf-78dd" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50"/>
      </characteristics>
    </profile>
    <profile name="Magic Resistance" hidden="false" id="90ed-c9be-a611-79cc" typeId="c1ac-c1c8-f9d5-9673" typeName="Special Rule">
      <characteristics>
        <characteristic name="Special Rule" typeId="9f84-4221-785a-db50">Description</characteristic>
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
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="9cb6-6690-ad82-be24-min"/>
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
    <selectionEntry type="upgrade" import="true" name="Spear" hidden="false" id="9113-238a-ef75-aa23">
      <constraints>
        <constraint type="min" value="1" field="selections" scope="parent" shared="true" id="2b55-9fe1-4d8d-e594-min"/>
        <constraint type="max" value="1" field="selections" scope="parent" shared="true" id="2b55-9fe1-4d8d-e594-max"/>
      </constraints>
      <infoLinks>
        <infoLink name="Spear" hidden="false" type="profile" id="1c94-5f0a-c42a-26aa" targetId="a344-4142-98e7-c06b"/>
      </infoLinks>
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
