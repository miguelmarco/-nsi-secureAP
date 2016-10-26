m = Map("wireless", "Configuración SecureAP", "")



s = m:section(TypedSection, "wifi-iface","", "")

s:append(Template("secureap/mask"))

ssid = s:option(Value, "ssid", "SSID", "Nombre de la red inalámbrica")
return m
