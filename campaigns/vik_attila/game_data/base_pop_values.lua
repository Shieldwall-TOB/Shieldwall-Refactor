--[[ This code was originally used to generate this list. 
dev.first_tick(function(context)
    local base_pop = {} --:map<string, {serf: number, lord: number}>
    local regions = dev.region_list()
    io.open("sheildwall_output_base_pop.tsv","w+")
    for i = 0, regions:num_items() - 1 do
        local region = regions:item_at(i)
        local main_building = region:settlement():slot_list():item_at(0):building():chain()
        local serf = 100 --:number
        local lord = 25 --:number
        if region:is_province_capital() then
            serf = serf + 300
            lord = lord + 175
        end
        local main_building_additions = {
            ["vik_market"] = {600, 0},
            ["vik_farm"] = {100, 25},
            ["vik_hunting"] = {-50, 50},
            ["vik_orchard"] = {50, 25},
            ["vik_pasture"] = {50, 0},
            ["vik_pottery"] = {100, 0},
            ["vik_salt"] = {100, 0},
        }--:map<string, {number, number}>
        if main_building_additions[main_building] then
            serf = serf + main_building_additions[main_building][1]
            lord = lord + main_building_additions[main_building][2]
        end
        base_pop[region:name()] = {serf = serf, lord = lord}
    end

    for k, v in pairs(base_pop) do
        dev.export("base_pop", "\t[\""..k.."\"] = {serf = "..v.serf..", lord = "..v.lord.."},")
    end
end)
]]



local base_pop =  {
	["vik_reg_sconnin"] = {serf = 50, lord = 5},
	["vik_reg_bathanceaster"] = {serf = 50, lord = 5},
	["vik_reg_scrobbesburg"] = {serf = 100, lord = 10},
	["vik_reg_cair_segeint"] = {serf = 50, lord = 5},
	["vik_reg_hagustaldes"] = {serf = 50, lord = 5},
	["vik_reg_inis_cathaigh"] = {serf = 50, lord = 5},
	["vik_reg_tanet"] = {serf = 50, lord = 5},
	["vik_reg_cell_mor"] = {serf = 100, lord = 10},
	["vik_reg_brug"] = {serf = 50, lord = 5},
	["vik_reg_totanes"] = {serf = 50, lord = 5},
	["vik_reg_guldeford"] = {serf = 50, lord = 5},
	["vik_reg_dunholm"] = {serf = 50, lord = 5},
	["vik_reg_brideport"] = {serf = 50, lord = 5},
	["vik_reg_deoraby"] = {serf = 50, lord = 5},
	["vik_reg_cell_alaid"] = {serf = 200, lord = 20},
	["vik_reg_dun_nechtain"] = {serf = 50, lord = 5},
	["vik_reg_eofesham"] = {serf = 50, lord = 5},
	["vik_reg_balla"] = {serf = 10, lord = 10},
	["vik_reg_ioua"] = {serf = 400, lord = 40},
	["vik_reg_otergimele"] = {serf = 100, lord = 10},
	["vik_reg_ebbesham"] = {serf = 50, lord = 5},
	["vik_reg_cippanhamm"] = {serf = 200, lord = 20},
	["vik_reg_lonceaster"] = {serf = 50, lord = 5},
	["vik_reg_hripum"] = {serf = 50, lord = 5},
	["vik_reg_stutfall"] = {serf = 50, lord = 5},
	["vik_reg_tamworthige"] = {serf = 600, lord = 60},
	["vik_reg_druim_collachair"] = {serf = 100, lord = 10},
	["vik_reg_wigingamere"] = {serf = 50, lord = 5},
	["vik_reg_ferna"] = {serf = 50, lord = 5},
	["vik_reg_flichesburg"] = {serf = 50, lord = 5},
	["vik_reg_northwic"] = {serf = 700, lord = 300},
	["vik_reg_thursa"] = {serf = 100, lord = 10},
	["vik_reg_dor"] = {serf = 50, lord = 5},
	["vik_reg_ros"] = {serf = 50, lord = 5},
	["vik_reg_loch_raich"] = {serf = 50, lord = 5},
	["vik_reg_latharna"] = {serf = 200, lord = 20},
	["vik_reg_casteltoun"] = {serf = 200, lord = 20},
	["vik_reg_lunden"] = {serf = 3000, lord = 200},
	["vik_reg_lann_afan"] = {serf = 50, lord = 5},
	["vik_reg_eidenburg"] = {serf = 500, lord = 100},
	["vik_reg_alclyt"] = {serf = 50, lord = 5},
	["vik_reg_ros_maircind"] = {serf = 50, lord = 5},
	["vik_reg_bornais"] = {serf = 300, lord = 50},
	["vik_reg_buccingahamm"] = {serf = 50, lord = 5},
	["vik_reg_cell_maic_aeda"] = {serf = 50, lord = 5},
	["vik_reg_staefford"] = {serf = 200, lord = 20},
	["vik_reg_glastingburi"] = {serf = 50, lord = 5},
	["vik_reg_suthhamtun"] = {serf = 100, lord = 10},
	["vik_reg_snotingaham"] = {serf = 300, lord = 30},
	["vik_reg_northhamtun"] = {serf = 300, lord = 30},
	["vik_reg_hereford"] = {serf = 100, lord = 10},
	["vik_reg_ligeraceaster"] = {serf = 50, lord = 5},
	["vik_reg_wiltun"] = {serf = 50, lord = 5},
	["vik_reg_rudglann"] = {serf = 50, lord = 5},
	["vik_reg_ros_ailithir"] = {serf = 50, lord = 5},
	["vik_reg_theodford"] = {serf = 50, lord = 5},
	["vik_reg_liwtune"] = {serf = 50, lord = 5},
	["vik_reg_menevia"] = {serf = 200, lord = 20},
	["vik_reg_gipeswic"] = {serf = 100, lord = 10},
	["vik_reg_stoc"] = {serf = 50, lord = 5},
	["vik_reg_coinnire"] = {serf = 50, lord = 5},
	["vik_reg_cathair_domnaill"] = {serf = 50, lord = 5},
	["vik_reg_cnodba"] = {serf = 50, lord = 5},
	["vik_reg_rendlesham"] = {serf = 200, lord = 20},
	["vik_reg_dun_att"] = {serf = 200, lord = 20},
	["vik_reg_dun_cailden"] = {serf = 200, lord = 20},
	["vik_reg_dacor"] = {serf = 50, lord = 5},
	["vik_reg_inis_faithlenn"] = {serf = 400, lord = 40},
	["vik_reg_rath_cruachan"] = {serf = 400, lord = 40},
	["vik_reg_coldingaham"] = {serf = 50, lord = 5},
	["vik_reg_sancte_albanes"] = {serf = 100, lord = 10},
	["vik_reg_wigracestre"] = {serf = 50, lord = 5},
	["vik_reg_gyruum"] = {serf = 100, lord = 10},
	["vik_reg_nedd"] = {serf = 50, lord = 5},
	["vik_reg_heslerton"] = {serf = 50, lord = 5},
	["vik_reg_rucestr"] = {serf = 50, lord = 5},
	["vik_reg_werham"] = {serf = 300, lord = 30},
	["vik_reg_tuaim"] = {serf = 50, lord = 5},
	["vik_reg_seolesigge"] = {serf = 400, lord = 40},
	["vik_reg_middeherst"] = {serf = 50, lord = 5},
	["vik_reg_latharn"] = {serf = 100, lord = 10},
	["vik_reg_sancte_germanes"] = {serf = 50, lord = 5},
	["vik_reg_sancte_eadmundes"] = {serf = 50, lord = 5},
	["vik_reg_carleol"] = {serf = 700, lord = 70},
	["vik_reg_wintanceaster"] = {serf = 1000, lord = 200},
	["vik_reg_dyflin"] = {serf = 400, lord = 100},
	["vik_reg_lis_mor"] = {serf = 50, lord = 5},
	["vik_reg_bodmine"] = {serf = 50, lord = 5},
	["vik_reg_mathrafal"] = {serf = 300, lord = 30},
	["vik_reg_cetretha"] = {serf = 300, lord = 30},
	["vik_reg_tintagol"] = {serf = 300, lord = 30},
	["vik_reg_laewe"] = {serf = 50, lord = 5},
	["vik_reg_earmutha"] = {serf = 100, lord = 10},
	["vik_reg_rinnin"] = {serf = 50, lord = 5},
	["vik_reg_licetfelda"] = {serf = 50, lord = 5},
	["vik_reg_aberteifi"] = {serf = 400, lord = 40},
	["vik_reg_grantabrycg"] = {serf = 300, lord = 30},
	["vik_reg_gleawceaster"] = {serf = 1000, lord = 100},
	["vik_reg_rofeceaster"] = {serf = 200, lord = 20},
	["vik_reg_herutford"] = {serf = 50, lord = 5},
	["vik_reg_cell_cainning"] = {serf = 50, lord = 5},
	["vik_reg_wiht"] = {serf = 50, lord = 5},
	["vik_reg_aelmham"] = {serf = 50, lord = 5},
	["vik_reg_ros_cuissine"] = {serf = 50, lord = 5},
	["vik_reg_lann_ildut"] = {serf = 100, lord = 10},
	["vik_reg_dun_patraic"] = {serf = 400, lord = 40},
	["vik_reg_cherchebi"] = {serf = 50, lord = 5},
	["vik_reg_caisil"] = {serf = 600, lord = 100},
	["vik_reg_elig"] = {serf = 50, lord = 5},
	["vik_reg_gleann_da_loch"] = {serf = 50, lord = 5},
	["vik_reg_rath_luraig"] = {serf = 100, lord = 10},
	["vik_reg_clocher"] = {serf = 100, lord = 10},
	["vik_reg_dun_eachainn"] = {serf = 50, lord = 5},
	["vik_reg_stornochway"] = {serf = 100, lord = 10},
	["vik_reg_guvan"] = {serf = 800, lord = 100},
	["vik_reg_an_tinbhear_mor"] = {serf = 200, lord = 20},
	["vik_reg_cell_daltain"] = {serf = 50, lord = 5},
	["vik_reg_basengas"] = {serf = 50, lord = 5},
	["vik_reg_aebburcurnig"] = {serf = 50, lord = 5},
	["vik_reg_cridiatune"] = {serf = 50, lord = 5},
	["vik_reg_haestingas"] = {serf = 400, lord = 40},
	["vik_reg_colneceaster"] = {serf = 1000, lord = 100},
	["vik_reg_waerincwicum"] = {serf = 200, lord = 20},
	["vik_reg_haverfordia"] = {serf = 50, lord = 5},
	["vik_reg_ard_fert"] = {serf = 50, lord = 5},
	["vik_reg_dofere"] = {serf = 200, lord = 20},
	["vik_reg_ard_mor"] = {serf = 200, lord = 20},
	["vik_reg_tuam_greine"] = {serf = 50, lord = 5},
	["vik_reg_dun_blann"] = {serf = 50, lord = 5},
	["vik_reg_airchardan"] = {serf = 300, lord = 30},
	["vik_reg_cantwaraburg"] = {serf = 400, lord = 40},
	["vik_reg_mameceaster"] = {serf = 400, lord = 40},
	["vik_reg_dun_foither"] = {serf = 200, lord = 20},
	["vik_reg_din_prys"] = {serf = 100, lord = 10},
	["vik_reg_dun_na_ngall"] = {serf = 200, lord = 20},
	["vik_reg_rocheberie"] = {serf = 50, lord = 5},
	["vik_reg_dun_aberte"] = {serf = 100, lord = 10},
	["vik_reg_cairlinn"] = {serf = 200, lord = 20},
	["vik_reg_veisafjordr"] = {serf = 300, lord = 30},
	["vik_reg_wyrcesuuyrthe"] = {serf = 50, lord = 5},
	["vik_reg_poclintun"] = {serf = 100, lord = 10},
	["vik_reg_dugannu"] = {serf = 100, lord = 10},
	["vik_reg_sancte_ye"] = {serf = 50, lord = 5},
	["vik_reg_lindcylne"] = {serf = 800, lord = 80},
	["vik_reg_hwitan_aerne"] = {serf = 50, lord = 5},
	["vik_reg_oxnaforda"] = {serf = 100, lord = 10},
	["vik_reg_axanbrycg"] = {serf = 50, lord = 5},
	["vik_reg_ethandun"] = {serf = 50, lord = 5},
	["vik_reg_lann_dewi"] = {serf = 50, lord = 5},
	["vik_reg_domuc"] = {serf = 200, lord = 20},
	["vik_reg_eoferwic"] = {serf = 2000, lord = 600},
	["vik_reg_waecet"] = {serf = 50, lord = 5},
	["vik_reg_tureceseig"] = {serf = 50, lord = 5},
	["vik_reg_loch_gabhair"] = {serf = 50, lord = 5},
	["vik_reg_corcach"] = {serf = 400, lord = 40},
	["vik_reg_oswaldestroe"] = {serf = 50, lord = 5},
	["vik_reg_cluain"] = {serf = 100, lord = 10},
	["vik_reg_aethelingaeg"] = {serf = 300 , lord = 30},
	["vik_reg_porteceaster"] = {serf = 50, lord = 5},
	["vik_reg_celmeresfort"] = {serf = 50, lord = 5},
	["vik_reg_cluain_eoais"] = {serf = 50, lord = 5},
	["vik_reg_na_seciri"] = {serf = 100, lord = 10},
	["vik_reg_sreth_belin"] = {serf = 200, lord = 20},
	["vik_reg_vedrafjordr"] = {serf = 300, lord = 30},
	["vik_reg_cenn_rigmonid"] = {serf = 100, lord = 10},
	["vik_reg_nas"] = {serf = 200, lord = 20},
	["vik_reg_lude"] = {serf = 50, lord = 5},
	["vik_reg_cissanbyrig"] = {serf = 100, lord = 10},
	["vik_reg_sceaftesburg"] = {serf = 100, lord = 10},
	["vik_reg_ceaster"] = {serf = 1000, lord = 200},
	["vik_reg_torfness"] = {serf = 100, lord = 10},
	["vik_reg_cluain_mor"] = {serf = 50, lord = 5},
	["vik_reg_achadh_bo"] = {serf = 400, lord = 40},
	["vik_reg_exanceaster"] = {serf = 400, lord = 40},
	["vik_reg_abberdeon"] = {serf = 100, lord = 10},
	["vik_reg_huntandun"] = {serf = 50, lord = 5},
	["vik_reg_inber_nise"] = {serf = 50, lord = 5},
	["vik_reg_beoferlic"] = {serf = 50, lord = 5},
	["vik_reg_ard_sratha"] = {serf = 100, lord = 10},
	["vik_reg_steanford"] = {serf = 300, lord = 30},
	["vik_reg_tor_in_duine"] = {serf = 200, lord = 20},
	["vik_reg_aporcrosan"] = {serf = 50, lord = 5},
	["vik_reg_bedanford"] = {serf = 50, lord = 5},
	["vik_reg_blascona"] = {serf = 400, lord = 40},
	["vik_reg_staeningum"] = {serf = 50, lord = 5},
	["vik_reg_aberffro"] = {serf = 800, lord = 100},
	["vik_reg_lann_idloes"] = {serf = 50, lord = 5},
	["vik_reg_dun_domnaill"] = {serf = 50, lord = 5},
	["vik_reg_drayton"] = {serf = 100, lord = 10},
	["vik_reg_alt_clut"] = {serf = 100, lord = 10},
	["vik_reg_dun_beccan"] = {serf = 100, lord = 10},
	["vik_reg_dinefwr"] = {serf = 300, lord = 30},
	["vik_reg_inis_patraic"] = {serf = 50, lord = 5},
	["vik_reg_grianan_aileach"] = {serf = 700, lord = 70},
	["vik_reg_dun_sebuirgi"] = {serf = 400, lord = 40},
	["vik_reg_lann_cors"] = {serf = 100, lord = 10},
	["vik_reg_cathair_commain"] = {serf = 300, lord = 30},
	["vik_reg_maeldune"] = {serf = 100, lord = 10},
	["vik_reg_forais"] = {serf = 50, lord = 5},
	["vik_reg_ardach"] = {serf = 100, lord = 10},
	["vik_reg_linns"] = {serf = 100, lord = 10},
	["vik_reg_mailros"] = {serf = 50, lord = 5},
	["vik_reg_dynbaer"] = {serf = 100, lord = 10},
	["vik_reg_dun_ollaig"] = {serf = 50, lord = 5},
	["vik_reg_scoan"] = {serf = 800, lord = 100},
	["vik_reg_cirenceaster"] = {serf = 50, lord = 5},
	["vik_reg_cair_mirddin"] = {serf = 50, lord = 5},
	["vik_reg_bebbanburg"] = {serf = 600, lord = 100},
	["vik_reg_druim_da_ethiar"] = {serf = 400, lord = 40},
	["vik_reg_cluain_iraird"] = {serf = 100, lord = 10},
	["vik_reg_dun_duirn"] = {serf = 50, lord = 5},
	["vik_reg_doreceaster"] = {serf = 200, lord = 20},
	["vik_reg_dinas_powis"] = {serf = 50, lord = 5},
	["vik_reg_dear"] = {serf = 50, lord = 5},
	["vik_reg_scireburnan"] = {serf = 50, lord = 5},
	["vik_reg_saigher"] = {serf = 50, lord = 5},
	["vik_reg_tilaburg"] = {serf = 50, lord = 5},
	["vik_reg_cair_gwent"] = {serf = 500, lord = 50},
	["vik_reg_doneceaster"] = {serf = 50, lord = 5},
	["vik_reg_brechin"] = {serf = 50, lord = 5},
	["vik_reg_ard_macha"] = {serf = 400, lord = 40},
	["vik_reg_loidis"] = {serf = 200, lord = 20},
	["vik_reg_hlymrekr"] = {serf = 500, lord = 50},
	["vik_reg_imblech_ibair"] = {serf = 100, lord = 10},
	["vik_reg_cluain_mac_nois"] = {serf = 800, lord = 200},
	["vik_reg_pefenesea"] = {serf = 50, lord = 5},
	["vik_reg_moige_bile"] = {serf = 100, lord = 10},
	["vik_reg_cenannas"] = {serf = 200, lord = 20},
	["vik_reg_lann_padarn"] = {serf = 50, lord = 5}
} --:map<string, {serf: number, lord: number}>

local slaves_factions = {
	[ "vik_fact_dyflin"] = 320
 }--:map<string, number>


return {
	region_values = base_pop,
	slaves_factions = slaves_factions
}