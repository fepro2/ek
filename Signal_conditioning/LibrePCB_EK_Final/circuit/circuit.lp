(librepcb_circuit
 (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856 (name "Std")
  (description "Standard assembly")
 )
 (netclass adede498-eac0-460b-b22e-f139b98fece8 (name "default"))
 (net 1b9139c3-87f9-4ce0-920f-d999608f1375 (auto false) (name "A-")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 456d921f-d897-46b9-af91-802cbd68d92b (auto true) (name "N4")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 570c9b4e-e204-41fe-bcde-37681cd135df (auto false) (name "Shield")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 6aa81b11-9244-4119-abc1-4c6d9aba08cb (auto true) (name "N1")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 779c27f3-63dc-4021-a1af-27caecbccbf0 (auto false) (name "A+")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 92429b43-0139-4a01-a932-23c6cd7feba9 (auto false) (name "Analog_Input")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d (auto false) (name "VCC")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net ab573884-5bda-48d5-86cb-c8c418848242 (auto true) (name "N5")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net ba426ec3-fb69-4a70-9f09-59e7d88f6615 (auto true) (name "N3")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (net bde70435-b76d-4af5-9af6-663423ca2812 (auto false) (name "GND")
  (netclass adede498-eac0-460b-b22e-f139b98fece8)
 )
 (component 12df3eee-bf9f-4e3e-a987-c423a4b37e94
  (lib_component 58c3c6cd-11eb-4557-aa3f-d3e05874afde)
  (lib_variant afb86b45-68ec-47b6-8d96-153d73567228)
  (name "VCC1") (value "VCC")
  (lock_assembly false)
  (signal 1d893320-f811-4a79-b64e-cc23d749d394 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
 )
 (component 2056dcec-a493-4177-a248-bb86f0aef313
  (lib_component d167e0e3-6a92-4b76-b013-77b9c230e5f1)
  (lib_variant 8cd7b37f-e5fa-4af5-a8dd-d78830bba3af)
  (name "C5") (value "{{CAPACITANCE}}")
  (lock_assembly false)
  (attribute "CAPACITANCE" (type capacitance) (unit nanofarad) (value ""))
  (device d0691a38-acb7-4a41-b889-99d7a2f92b10
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device fc8c6fd6-6fd0-4e61-bdcc-b20046ebfd42
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 1c1c7abc-7b40-4f92-b533-f65604644db7 (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal 6d776f4d-2a7c-4128-a98a-dbb1dd861411 (net ba426ec3-fb69-4a70-9f09-59e7d88f6615))
 )
 (component 2172c5f2-4b92-44be-a7b7-974e439d2777
  (lib_component ef80cd5e-2689-47ee-8888-31d04fc99174)
  (lib_variant a5995314-f535-45d4-8bd8-2d0b8a0dc42a)
  (name "R1") (value "{{RESISTANCE}}")
  (lock_assembly false)
  (attribute "RESISTANCE" (type resistance) (unit ohm) (value ""))
  (device dd53b53b-5c7a-4f96-9a6e-771708b23895
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device a8b774c7-d868-4138-93c9-88c0c80598a1
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 3452d36e-1ce8-4b7c-8e5b-90c2e4929ed8 (net 1b9139c3-87f9-4ce0-920f-d999608f1375))
  (signal ad623f98-9e73-49c3-9404-f7cfa99d17cd (net ba426ec3-fb69-4a70-9f09-59e7d88f6615))
 )
 (component 53bc156c-ddb0-4cdc-b1e4-3a0697205cdb
  (lib_component ef80cd5e-2689-47ee-8888-31d04fc99174)
  (lib_variant a5995314-f535-45d4-8bd8-2d0b8a0dc42a)
  (name "R1_2") (value "{{RESISTANCE}}")
  (lock_assembly false)
  (attribute "RESISTANCE" (type resistance) (unit ohm) (value ""))
  (device dd53b53b-5c7a-4f96-9a6e-771708b23895
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device a8b774c7-d868-4138-93c9-88c0c80598a1
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 3452d36e-1ce8-4b7c-8e5b-90c2e4929ed8 (net 779c27f3-63dc-4021-a1af-27caecbccbf0))
  (signal ad623f98-9e73-49c3-9404-f7cfa99d17cd (net 6aa81b11-9244-4119-abc1-4c6d9aba08cb))
 )
 (component 74516d57-fb13-46f0-9dbe-071665de6099
  (lib_component 8076f6be-bfab-4fc1-9772-5d54465dd7e1)
  (lib_variant f09ad258-595b-4ee9-a1fc-910804a203ae)
  (name "GND5") (value "GND")
  (lock_assembly false)
  (signal ff161c97-29a5-43aa-a9ae-3ca7a66982ce (net bde70435-b76d-4af5-9af6-663423ca2812))
 )
 (component 7f46bd6d-5753-4859-ba1c-a230c4240b70
  (lib_component 8076f6be-bfab-4fc1-9772-5d54465dd7e1)
  (lib_variant f09ad258-595b-4ee9-a1fc-910804a203ae)
  (name "GND3") (value "GND")
  (lock_assembly false)
  (signal ff161c97-29a5-43aa-a9ae-3ca7a66982ce (net 570c9b4e-e204-41fe-bcde-37681cd135df))
 )
 (component 96c7c4b6-2c4e-46e5-9cda-ee9ef85349d2
  (lib_component d167e0e3-6a92-4b76-b013-77b9c230e5f1)
  (lib_variant 8cd7b37f-e5fa-4af5-a8dd-d78830bba3af)
  (name "C6") (value "{{CAPACITANCE}}")
  (lock_assembly false)
  (attribute "CAPACITANCE" (type capacitance) (unit nanofarad) (value ""))
  (device d0691a38-acb7-4a41-b889-99d7a2f92b10
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device fc8c6fd6-6fd0-4e61-bdcc-b20046ebfd42
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 1c1c7abc-7b40-4f92-b533-f65604644db7 (net ba426ec3-fb69-4a70-9f09-59e7d88f6615))
  (signal 6d776f4d-2a7c-4128-a98a-dbb1dd861411 (net 6aa81b11-9244-4119-abc1-4c6d9aba08cb))
 )
 (component 9ce76e9d-0109-4dc3-9fa1-b832f2600bb0
  (lib_component 8076f6be-bfab-4fc1-9772-5d54465dd7e1)
  (lib_variant f09ad258-595b-4ee9-a1fc-910804a203ae)
  (name "GND2") (value "GND")
  (lock_assembly false)
  (signal ff161c97-29a5-43aa-a9ae-3ca7a66982ce (net bde70435-b76d-4af5-9af6-663423ca2812))
 )
 (component a809096c-5af0-428d-bdd2-27fc5bd83d18
  (lib_component 8076f6be-bfab-4fc1-9772-5d54465dd7e1)
  (lib_variant f09ad258-595b-4ee9-a1fc-910804a203ae)
  (name "GND4") (value "GND")
  (lock_assembly false)
  (signal ff161c97-29a5-43aa-a9ae-3ca7a66982ce (net bde70435-b76d-4af5-9af6-663423ca2812))
 )
 (component ae255b59-02e2-43fe-adb1-57b3c9b78403
  (lib_component ef80cd5e-2689-47ee-8888-31d04fc99174)
  (lib_variant a5995314-f535-45d4-8bd8-2d0b8a0dc42a)
  (name "R2") (value "{{RESISTANCE}}")
  (lock_assembly false)
  (attribute "RESISTANCE" (type resistance) (unit ohm) (value ""))
  (device dd53b53b-5c7a-4f96-9a6e-771708b23895
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device a8b774c7-d868-4138-93c9-88c0c80598a1
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 3452d36e-1ce8-4b7c-8e5b-90c2e4929ed8 (net ab573884-5bda-48d5-86cb-c8c418848242))
  (signal ad623f98-9e73-49c3-9404-f7cfa99d17cd (net 456d921f-d897-46b9-af91-802cbd68d92b))
 )
 (component afc6dedb-9969-46f9-9be2-1e5992eecee8
  (lib_component d167e0e3-6a92-4b76-b013-77b9c230e5f1)
  (lib_variant 8cd7b37f-e5fa-4af5-a8dd-d78830bba3af)
  (name "C7") (value "{{CAPACITANCE}}")
  (lock_assembly false)
  (attribute "CAPACITANCE" (type capacitance) (unit nanofarad) (value ""))
  (device d0691a38-acb7-4a41-b889-99d7a2f92b10
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device fc8c6fd6-6fd0-4e61-bdcc-b20046ebfd42
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 1c1c7abc-7b40-4f92-b533-f65604644db7 (net 6aa81b11-9244-4119-abc1-4c6d9aba08cb))
  (signal 6d776f4d-2a7c-4128-a98a-dbb1dd861411 (net bde70435-b76d-4af5-9af6-663423ca2812))
 )
 (component b59b7c7d-2cc2-49c4-8c17-dc4dc79d5220
  (lib_component d167e0e3-6a92-4b76-b013-77b9c230e5f1)
  (lib_variant 8cd7b37f-e5fa-4af5-a8dd-d78830bba3af)
  (name "C8") (value "{{CAPACITANCE}}")
  (lock_assembly false)
  (attribute "CAPACITANCE" (type capacitance) (unit nanofarad) (value ""))
  (device d0691a38-acb7-4a41-b889-99d7a2f92b10
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device c139e505-592b-46ba-bdf2-acb7383ea0cd
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (device fc8c6fd6-6fd0-4e61-bdcc-b20046ebfd42
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 1c1c7abc-7b40-4f92-b533-f65604644db7 (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal 6d776f4d-2a7c-4128-a98a-dbb1dd861411 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
 )
 (component cb118a68-93ff-4d6e-8957-73fd383a402f
  (lib_component 8076f6be-bfab-4fc1-9772-5d54465dd7e1)
  (lib_variant f09ad258-595b-4ee9-a1fc-910804a203ae)
  (name "GND1") (value "GND")
  (lock_assembly false)
  (signal ff161c97-29a5-43aa-a9ae-3ca7a66982ce (net bde70435-b76d-4af5-9af6-663423ca2812))
 )
 (component d0829b95-7683-4522-8162-35e00b56c8b4
  (lib_component 98e71eaa-1b90-4a84-8529-ed4f493e5c41)
  (lib_variant 352cccd5-0c3c-4c66-88e0-6ee7c6a3cbf9)
  (name "FRAME1") (value "")
  (lock_assembly false)
  (attribute "FIELD_SHEET" (type string) (unit none) (value "{{ SCH_FRAME_SHEET or SHEET }}"))
  (attribute "FIELD_PROJECT" (type string) (unit none) (value "{{ SCH_FRAME_PROJECT or PROJECT }}"))
  (attribute "FIELD_VERSION" (type string) (unit none) (value "{{ SCH_FRAME_VERSION or VERSION }}"))
  (attribute "FIELD_DATE" (type string) (unit none) (value "{{ SCH_FRAME_DATE or DATE }}"))
  (attribute "FIELD_AUTHOR" (type string) (unit none) (value "{{ SCH_FRAME_AUTHOR or AUTHOR }}"))
  (attribute "FIELD_PAGE" (type string) (unit none) (value "{{ SCH_FRAME_PAGE_X_OF_Y or PAGE_X_OF_Y }}"))
 )
 (component eb9faaf5-9722-4889-99ec-361eadfbf3d8
  (lib_component 721e4b9e-b258-4c3d-b6ae-dc846d0436d0)
  (lib_variant dba20064-4181-4349-8df7-72b1727ff725)
  (name "J5") (value "{{MPN}}")
  (lock_assembly false)
  (device 3edd28fe-6181-4fc3-8d44-7434c6d727cf
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 10d8bda5-f95c-4c11-8687-42d5b72f5a22 (net none))
  (signal 18b84439-7699-4dee-a40d-c55d9c45e686 (net none))
  (signal 35063022-9185-4dee-a6b2-2b672b856e38 (net 92429b43-0139-4a01-a932-23c6cd7feba9))
  (signal 3fcc0a59-581f-4a2d-86e6-68d9ee70c4dd (net none))
  (signal 4e6bec2a-1e32-4f6f-a2fb-6e96d2988020 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
  (signal 84b52d32-348b-488a-920e-ecf75a785e06 (net none))
  (signal 90498859-82c7-4670-b3d1-925bb2ecd472 (net none))
  (signal a3efac7e-0edd-497a-a33c-4738b2bd4a17 (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal a921dce0-264b-4c00-8e5d-c70ce26289f9 (net none))
  (signal ac959a47-627d-4548-b708-e8fa1275ffe7 (net none))
  (signal c492e7d6-0c49-4c00-b6e9-a6cb8cd14b57 (net none))
  (signal e2eee273-72a5-43c8-9e7d-f024d49af771 (net none))
 )
 (component f7492ec0-0c00-4875-907b-627f3be7eabb
  (lib_component 721e4b9e-b258-4c3d-b6ae-dc846d0436d0)
  (lib_variant dba20064-4181-4349-8df7-72b1727ff725)
  (name "J6") (value "{{MPN}}")
  (lock_assembly false)
  (device 3edd28fe-6181-4fc3-8d44-7434c6d727cf
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 10d8bda5-f95c-4c11-8687-42d5b72f5a22 (net 570c9b4e-e204-41fe-bcde-37681cd135df))
  (signal 18b84439-7699-4dee-a40d-c55d9c45e686 (net none))
  (signal 35063022-9185-4dee-a6b2-2b672b856e38 (net 1b9139c3-87f9-4ce0-920f-d999608f1375))
  (signal 3fcc0a59-581f-4a2d-86e6-68d9ee70c4dd (net none))
  (signal 4e6bec2a-1e32-4f6f-a2fb-6e96d2988020 (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal 84b52d32-348b-488a-920e-ecf75a785e06 (net none))
  (signal 90498859-82c7-4670-b3d1-925bb2ecd472 (net none))
  (signal a3efac7e-0edd-497a-a33c-4738b2bd4a17 (net 779c27f3-63dc-4021-a1af-27caecbccbf0))
  (signal a921dce0-264b-4c00-8e5d-c70ce26289f9 (net none))
  (signal ac959a47-627d-4548-b708-e8fa1275ffe7 (net none))
  (signal c492e7d6-0c49-4c00-b6e9-a6cb8cd14b57 (net none))
  (signal e2eee273-72a5-43c8-9e7d-f024d49af771 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
 )
 (component f9576c3f-73a0-474c-b2d4-ad9b5018bac4
  (lib_component d9dd5c4b-d9c4-4e6f-b0b8-d48e5a177c67)
  (lib_variant bdd2e2df-2477-4f57-9359-ac58f3744e0b)
  (name "IA1") (value "{{MPN or DEVICE}}")
  (lock_assembly false)
  (device 163bdb87-5e2f-4f9c-b285-336547fdf9fb
   (variant 286f7a8b-2e2c-4591-9f2c-dae376d9a856)
  )
  (signal 02f0af98-2451-4603-950a-e962613034cc (net 6aa81b11-9244-4119-abc1-4c6d9aba08cb))
  (signal 06769bb9-a959-4b79-8d92-e66a46d5a0e6 (net 92429b43-0139-4a01-a932-23c6cd7feba9))
  (signal 3af6013b-267c-4b13-8417-299ef18ca4eb (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal 53154844-faa5-4587-af25-18ce198dcfd7 (net ab573884-5bda-48d5-86cb-c8c418848242))
  (signal 6bdaa63a-c679-48f9-9698-cac4e2f9082a (net bde70435-b76d-4af5-9af6-663423ca2812))
  (signal baf8a5ff-cc1f-47c6-90dc-a5a83e675bc4 (net ba426ec3-fb69-4a70-9f09-59e7d88f6615))
  (signal dbff3c37-d75e-4a0e-9e44-0c45fcf0ac08 (net 456d921f-d897-46b9-af91-802cbd68d92b))
  (signal e5960181-d786-41eb-940b-411dacccbde9 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
 )
 (component f9eb8c2a-032e-473b-a198-ddfe72c130ae
  (lib_component 58c3c6cd-11eb-4557-aa3f-d3e05874afde)
  (lib_variant afb86b45-68ec-47b6-8d96-153d73567228)
  (name "VCC2") (value "VCC")
  (lock_assembly false)
  (signal 1d893320-f811-4a79-b64e-cc23d749d394 (net 9d3869fc-5202-424f-8fa0-38009bf2d24d))
 )
)
