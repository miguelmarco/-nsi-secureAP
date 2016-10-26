module("luci.controller.secureap.control", package.seeall)
function index()
    entry({"admin", "secureap"}, firstchild(), "SecureAP", 20).dependent=false
--    entry({"admin", "newtab", "intro"}, template("secureap/mask"), "Mask", 40).dependent=false
--     entry({"admin", "secureap", "temp"}, template("secureap/temp"), "Temp", 20).dependent=false
    entry({"admin", "secureap", "name"}, cbi("secureap/temp"), "Nombre de la red", 30).dependent=false
    entry({"admin", "secureap", "passwd"}, cbi("secureap/passwd"), "Contraseña", 40).dependent=false
    entry({"admin", "secureap", "ticket"}, cbi("secureap/ticket"), "Ticket", 
50).dependent=false
end
