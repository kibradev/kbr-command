--{ Türkçeleştirme ve düzenleme yapılmıştır --www.fivemturk.com }--
ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
 
RegisterCommand("mesleğim", function(source)
  local _source = source
  local kisi = ESX.GetPlayerFromId(_source)
  local meslek = kisi.job.label 
  local seviye = kisi.job.grade_label
  if meslek == "Unemployed" then 
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Bir işte çalışmıyorsunuz', length = 5000})  
  else 
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Mesleğin: ' .. meslek .. ' - ' .. seviye, length = 5000})  
  end
end)

RegisterCommand("parabak", function(source)
  local _source = source
  local kisi = ESX.GetPlayerFromId(_source)
  local nakitpara = getMoneyFromUser(_source)
  if nakitpara == 0 then 
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Üstünüzde nakit para bulunmamaktadır.', length = 5000})  
  else 
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Toplam Nakit Paranız: '..nakitpara .. ' TL', length = 5000})  
  end 
end) 

RegisterCommand("bankapara", function(source)
local _source = source
local kisi = ESX.GetPlayerFromId(_source)
local bankaparasi = getBankFromUser(_source)
if bankaparasi == 0 then 
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Banka Hesabınızda para bulunmamaktadır.', length = 5000})  
else 
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Toplam Bankadaki Paranız: '..bankaparasi.. ' TL', length = 5000})  
end 
end)

RegisterCommand("karapara", function(source)
  local _source = source
  local kisi = ESX.GetPlayerFromId(_source)
  local karapara = getBlackMoneyFromUser(_source)
  if karapara == 0 then 
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Üzerinizde Karapara bulunmamaktadır.', length = 5000})  
  else 
  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Toplam Bosphcoin:  '..karapara, length = 5000})  
  end 
  end)




