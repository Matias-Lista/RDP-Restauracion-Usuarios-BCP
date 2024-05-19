
#Importar datos desde los archivos CSV.
$usuarios = @(Import-Csv usuarios.csv)
$gruposACrear = @(Import-Csv grupos.csv)

#Crear grupos locales.
for (($i = 0); ($i -lt $gruposACrear.length); ($i++)) {
	if (-Not (Get-LocalGroup -Name $gruposACrear[$i].NOMBRE -ErrorAction SilentlyContinue)) {
		New-LocalGroup -Name $gruposACrear[$i].NOMBRE -Description $gruposACrear[$i].DESCRIPCION
	}
}

# Crear los usuarios Locales y asignarles los grupos.
for (($i = 0); ($i -lt $usuarios.length); ($i++))
{
	$psw = ConvertTo-SecureString $usuarios[$i].CONTRASENA -AsPlainText -Force

	New-LocalUser -Name $usuarios[$i].USERNAME -FULLNAME $usuarios[$i].FULLNAME -password $psw -AccountNeverExpires -PasswordNeverExpires
	
	# Asignar al usuario los grupos por defecto.
	Add-LocalGroupMember -Name "Power Users" -member $usuarios[$i].USERNAME
	Add-LocalGroupMember -Name "Remote Desktop Users" -member $usuarios[$i].USERNAME
	Add-LocalGroupMember -Name "Users" -member $usuarios[$i].USERNAME
	
	# Asignar a los usuarios los grupos especificos del archivo CSV.
	$grupos = $usuarios[$i].GRUPOS -split "-"
	for (($b=0); ($b -lt $groups.length); ($b++)) {
		Add-LocalGroupMember -Name $groups[$b] -Member $usuarios[$i].USERNAME
	}
	
}