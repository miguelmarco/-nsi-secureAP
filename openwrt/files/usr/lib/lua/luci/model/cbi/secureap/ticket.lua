local ticketfile = "/etc/SecureAP/printtemplate"


f = SimpleForm("ticketconf", translate("Texto de los tickets"), translate("Edite el texto del ticket"))


f:append(Template("secureap/ticket"))

du = f:field(Value, "duracion", "Duración")
du.wrap = "off"
du.rows = 1

function du.handle(self, state, data)
    return true
end

un = f:field(ListValue, "unidad", translate("Unidad de tiempo"), "")
un:value("Minutos")
un:value("Horas")
un:value("Días")
un:value("Permanente")

bo = f:field(Button, "ticketconf", translate("Generar"), "")

function bo.write()
    local cadena = "sh /etc/SecureAP/generauser "
    cadena = "echo "
    if f:formvalue("unidad") == "Permanente"
    then
        cadena = cadena .. f:cfgvalue("duracion")
        cadena = cadena .. " " .. un:cfgvalue("unidad")
    end
    luci.sys.call(cadena .. " > /root/aa") 
end

function bo.validate()
    return true
end


t = f:field(TextValue, "lines")
t.wrap = "off"
t.rows = 20

function t.cfgvalue()
    return nixio.fs.readfile(ticketfile) or ""
end

function t.write(self, section, data)
    return nixio.fs.writefile(ticketfile, data:gsub("\r\n", "\n"))
end

function f.handle(self, state, data)
    return true
end

-- g = SimpleForm("ticketconf", translate("Emitir ticket"), translate("Emitir tickets de usuario"))



return f
