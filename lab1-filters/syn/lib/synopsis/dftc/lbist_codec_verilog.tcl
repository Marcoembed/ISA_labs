#!/usr/local/bin/tclsh

################################################################################
##
##       This confidential and proprietary software may be used only
##     as authorized by a licensing agreement from Synopsys Inc.
##     In the event of publication, the following notice is applicable:
##
##                    (C) COPYRIGHT 2005  - 2021 SYNOPSYS INC.
##                           ALL RIGHTS RESERVED
##
##       The entire notice above must be reproduced on all authorized
##     copies.
##
## AUTHOR:    Frederic Neuveux,  January 3, 2005
##
## VERSION:   TCL/HDL file for LBIST codec in Verilog
##
## DFT IP ID: 17b72672
## DFT_release: S-2021.06-DWBB_202106.4
##
################################################################################

# set chain_count 17

#  set          autodbist 0;
# set          codec_count 2;
#  set          diag_output 1;

# set gen_bist_fail 0
 set bist_type  1     
# #  1-DBIST; 2-XDBIST
#  set prpg_length  257
#  set shadow_width  6


puts "
//------------------------------------------------------------------"
puts "//-  LogicBIST Generated hdl"
puts "//-
//-   (C) COPYRIGHT 2004 - 2005, SYNOPSYS, INC.   -
//-              ALL RIGHTS RESERVED              -
//-
//------------------------------------------------------------------"
if { $prpg_length == 479 } {
    puts "

//------------------------------------------------------------------
// Phase shifter block definition 479 -> 512
//------------------------------------------------------------------"
puts "module DFT_shifter_[expr $chain_count]_479_512\ (lfsrout, prpg_out\);

input \[478:0\] lfsrout;
output \[[expr $chain_count-1]:0\] prpg_out;
wire \[511:0\] prpg_out_i;

  assign prpg_out\[[expr $chain_count-1]:0\] = prpg_out_i\[[expr $chain_count-1]:0\];

  assign prpg_out_i\[0\] = prpg_out_i\[26\] ^ lfsrout\[428\];
  assign prpg_out_i\[1\] = prpg_out_i\[345\] ^ lfsrout\[469\];
  assign prpg_out_i\[2\] = prpg_out_i\[478\] ^ lfsrout\[305\];
  assign prpg_out_i\[3\] =lfsrout\[304\] ^ lfsrout\[389\];
  assign prpg_out_i\[4\] = prpg_out_i\[397\] ^ lfsrout\[398\];
  assign prpg_out_i\[5\] = prpg_out_i\[335\] ^ lfsrout\[175\];
  assign prpg_out_i\[6\] =lfsrout\[284\] ^ lfsrout\[306\];
  assign prpg_out_i\[7\] = prpg_out_i\[501\] ^ lfsrout\[375\];
  assign prpg_out_i\[8\] = prpg_out_i\[116\] ^ lfsrout\[386\];
  assign prpg_out_i\[9\] = prpg_out_i\[234\] ^ lfsrout\[55\];
  assign prpg_out_i\[10\] =lfsrout\[201\] ^ lfsrout\[474\];
  assign prpg_out_i\[11\] =lfsrout\[181\] ^ lfsrout\[338\];
  assign prpg_out_i\[12\] = prpg_out_i\[437\] ^ lfsrout\[106\];
  assign prpg_out_i\[13\] = prpg_out_i\[111\] ^ lfsrout\[380\];
  assign prpg_out_i\[14\] = prpg_out_i\[269\] ^ lfsrout\[255\];
  assign prpg_out_i\[15\] = prpg_out_i\[184\] ^ lfsrout\[163\];
  assign prpg_out_i\[16\] = prpg_out_i\[34\] ^ lfsrout\[250\];
  assign prpg_out_i\[17\] = prpg_out_i\[256\] ^ lfsrout\[312\];
  assign prpg_out_i\[18\] = prpg_out_i\[156\] ^ lfsrout\[287\];
  assign prpg_out_i\[19\] = prpg_out_i\[505\] ^ lfsrout\[212\];
  assign prpg_out_i\[20\] = prpg_out_i\[462\] ^ lfsrout\[68\];
  assign prpg_out_i\[21\] =lfsrout\[212\] ^ lfsrout\[400\];
  assign prpg_out_i\[22\] = prpg_out_i\[389\] ^ lfsrout\[345\];
  assign prpg_out_i\[23\] = prpg_out_i\[358\] ^ lfsrout\[213\];
  assign prpg_out_i\[24\] = prpg_out_i\[381\] ^ lfsrout\[255\];
  assign prpg_out_i\[25\] = prpg_out_i\[438\] ^ lfsrout\[38\];
  assign prpg_out_i\[26\] = prpg_out_i\[113\] ^ lfsrout\[175\];
  assign prpg_out_i\[27\] = prpg_out_i\[21\] ^ lfsrout\[442\];
  assign prpg_out_i\[28\] = prpg_out_i\[77\] ^ lfsrout\[306\];
  assign prpg_out_i\[29\] = prpg_out_i\[347\] ^ lfsrout\[244\];
  assign prpg_out_i\[30\] = prpg_out_i\[310\] ^ lfsrout\[435\];
  assign prpg_out_i\[31\] = prpg_out_i\[166\] ^ lfsrout\[162\];
  assign prpg_out_i\[32\] = prpg_out_i\[148\] ^ lfsrout\[36\];
  assign prpg_out_i\[33\] = prpg_out_i\[161\] ^ lfsrout\[267\];
  assign prpg_out_i\[34\] = prpg_out_i\[500\] ^ lfsrout\[285\];
  assign prpg_out_i\[35\] = prpg_out_i\[253\] ^ lfsrout\[285\];
  assign prpg_out_i\[36\] = prpg_out_i\[9\] ^ lfsrout\[7\];
  assign prpg_out_i\[37\] =lfsrout\[43\] ^ lfsrout\[272\];
  assign prpg_out_i\[38\] =lfsrout\[248\] ^ lfsrout\[381\];
  assign prpg_out_i\[39\] = prpg_out_i\[36\] ^ lfsrout\[25\];
  assign prpg_out_i\[40\] = prpg_out_i\[411\] ^ lfsrout\[341\];
  assign prpg_out_i\[41\] =lfsrout\[246\] ^ lfsrout\[288\];
  assign prpg_out_i\[42\] = prpg_out_i\[421\] ^ lfsrout\[367\];
  assign prpg_out_i\[43\] = prpg_out_i\[506\] ^ lfsrout\[22\];
  assign prpg_out_i\[44\] = prpg_out_i\[82\] ^ lfsrout\[408\];
  assign prpg_out_i\[45\] = prpg_out_i\[351\] ^ lfsrout\[461\];
  assign prpg_out_i\[46\] = prpg_out_i\[356\] ^ lfsrout\[289\];
  assign prpg_out_i\[47\] = prpg_out_i\[52\] ^ lfsrout\[210\];
  assign prpg_out_i\[48\] =lfsrout\[109\] ^ lfsrout\[348\];
  assign prpg_out_i\[49\] = prpg_out_i\[141\] ^ lfsrout\[341\];
  assign prpg_out_i\[50\] = prpg_out_i\[175\] ^ lfsrout\[286\];
  assign prpg_out_i\[51\] = prpg_out_i\[361\] ^ lfsrout\[146\];
  assign prpg_out_i\[52\] =lfsrout\[44\] ^ lfsrout\[445\];
  assign prpg_out_i\[53\] = prpg_out_i\[494\] ^ lfsrout\[66\];
  assign prpg_out_i\[54\] = prpg_out_i\[191\] ^ lfsrout\[70\];
  assign prpg_out_i\[55\] = prpg_out_i\[465\] ^ lfsrout\[475\];
  assign prpg_out_i\[56\] = prpg_out_i\[57\] ^ lfsrout\[165\];
  assign prpg_out_i\[57\] = prpg_out_i\[396\] ^ lfsrout\[122\];
  assign prpg_out_i\[58\] = prpg_out_i\[409\] ^ lfsrout\[72\];
  assign prpg_out_i\[59\] = prpg_out_i\[68\] ^ lfsrout\[157\];
  assign prpg_out_i\[60\] = prpg_out_i\[78\] ^ lfsrout\[219\];
  assign prpg_out_i\[61\] = prpg_out_i\[329\] ^ lfsrout\[63\];
  assign prpg_out_i\[62\] = prpg_out_i\[454\] ^ lfsrout\[233\];
  assign prpg_out_i\[63\] = prpg_out_i\[343\] ^ lfsrout\[411\];
  assign prpg_out_i\[64\] = prpg_out_i\[50\] ^ lfsrout\[143\];
  assign prpg_out_i\[65\] = prpg_out_i\[297\] ^ lfsrout\[469\];
  assign prpg_out_i\[66\] = prpg_out_i\[242\] ^ lfsrout\[94\];
  assign prpg_out_i\[67\] = prpg_out_i\[81\] ^ lfsrout\[105\];
  assign prpg_out_i\[68\] = prpg_out_i\[425\] ^ lfsrout\[60\];
  assign prpg_out_i\[69\] = prpg_out_i\[133\] ^ lfsrout\[256\];
  assign prpg_out_i\[70\] =lfsrout\[14\] ^ lfsrout\[361\];
  assign prpg_out_i\[71\] = prpg_out_i\[293\] ^ lfsrout\[199\];
  assign prpg_out_i\[72\] = prpg_out_i\[316\] ^ lfsrout\[439\];
  assign prpg_out_i\[73\] = prpg_out_i\[304\] ^ lfsrout\[237\];
  assign prpg_out_i\[74\] = prpg_out_i\[451\] ^ lfsrout\[429\];
  assign prpg_out_i\[75\] = prpg_out_i\[417\] ^ lfsrout\[98\];
  assign prpg_out_i\[76\] = prpg_out_i\[475\] ^ lfsrout\[28\];
  assign prpg_out_i\[77\] =lfsrout\[219\] ^ lfsrout\[404\];
  assign prpg_out_i\[78\] = prpg_out_i\[325\] ^ lfsrout\[156\];
  assign prpg_out_i\[79\] = prpg_out_i\[48\] ^ lfsrout\[365\];
  assign prpg_out_i\[80\] =lfsrout\[256\] ^ lfsrout\[328\];
  assign prpg_out_i\[81\] = prpg_out_i\[80\] ^ lfsrout\[213\];
  assign prpg_out_i\[82\] = prpg_out_i\[341\] ^ lfsrout\[337\];
  assign prpg_out_i\[83\] = prpg_out_i\[215\] ^ lfsrout\[354\];
  assign prpg_out_i\[84\] = prpg_out_i\[482\] ^ lfsrout\[233\];
  assign prpg_out_i\[85\] = prpg_out_i\[96\] ^ lfsrout\[114\];
  assign prpg_out_i\[86\] = prpg_out_i\[171\] ^ lfsrout\[253\];
  assign prpg_out_i\[87\] = prpg_out_i\[489\] ^ lfsrout\[308\];
  assign prpg_out_i\[88\] = prpg_out_i\[158\] ^ lfsrout\[193\];
  assign prpg_out_i\[89\] = prpg_out_i\[508\] ^ lfsrout\[116\];
  assign prpg_out_i\[90\] = prpg_out_i\[33\] ^ lfsrout\[266\];
  assign prpg_out_i\[91\] = prpg_out_i\[312\] ^ lfsrout\[147\];
  assign prpg_out_i\[92\] = prpg_out_i\[408\] ^ lfsrout\[473\];
  assign prpg_out_i\[93\] = prpg_out_i\[14\] ^ lfsrout\[1\];
  assign prpg_out_i\[94\] = prpg_out_i\[328\] ^ lfsrout\[46\];
  assign prpg_out_i\[95\] = prpg_out_i\[243\] ^ lfsrout\[467\];
  assign prpg_out_i\[96\] = prpg_out_i\[218\] ^ lfsrout\[233\];
  assign prpg_out_i\[97\] = prpg_out_i\[229\] ^ lfsrout\[247\];
  assign prpg_out_i\[98\] = prpg_out_i\[294\] ^ lfsrout\[153\];
  assign prpg_out_i\[99\] = prpg_out_i\[400\] ^ lfsrout\[56\];
  assign prpg_out_i\[100\] = prpg_out_i\[163\] ^ lfsrout\[347\];
  assign prpg_out_i\[101\] = prpg_out_i\[213\] ^ lfsrout\[155\];
  assign prpg_out_i\[102\] = prpg_out_i\[244\] ^ lfsrout\[372\];
  assign prpg_out_i\[103\] = prpg_out_i\[214\] ^ lfsrout\[95\];
  assign prpg_out_i\[104\] = prpg_out_i\[418\] ^ lfsrout\[409\];
  assign prpg_out_i\[105\] = prpg_out_i\[115\] ^ lfsrout\[423\];
  assign prpg_out_i\[106\] = prpg_out_i\[496\] ^ lfsrout\[59\];
  assign prpg_out_i\[107\] =lfsrout\[384\] ^ lfsrout\[407\];
  assign prpg_out_i\[108\] = prpg_out_i\[150\] ^ lfsrout\[414\];
  assign prpg_out_i\[109\] = prpg_out_i\[372\] ^ lfsrout\[250\];
  assign prpg_out_i\[110\] = prpg_out_i\[197\] ^ lfsrout\[433\];
  assign prpg_out_i\[111\] =lfsrout\[163\] ^ lfsrout\[249\];
  assign prpg_out_i\[112\] = prpg_out_i\[10\] ^ lfsrout\[368\];
  assign prpg_out_i\[113\] = prpg_out_i\[29\] ^ lfsrout\[122\];
  assign prpg_out_i\[114\] = prpg_out_i\[371\] ^ lfsrout\[408\];
  assign prpg_out_i\[115\] = prpg_out_i\[390\] ^ lfsrout\[195\];
  assign prpg_out_i\[116\] = prpg_out_i\[352\] ^ lfsrout\[240\];
  assign prpg_out_i\[117\] =lfsrout\[166\] ^ lfsrout\[215\];
  assign prpg_out_i\[118\] =lfsrout\[116\] ^ lfsrout\[313\];
  assign prpg_out_i\[119\] = prpg_out_i\[30\] ^ lfsrout\[457\];
  assign prpg_out_i\[120\] = prpg_out_i\[380\] ^ lfsrout\[183\];
  assign prpg_out_i\[121\] = prpg_out_i\[204\] ^ lfsrout\[69\];
  assign prpg_out_i\[122\] = prpg_out_i\[252\] ^ lfsrout\[222\];
  assign prpg_out_i\[123\] = prpg_out_i\[480\] ^ lfsrout\[286\];
  assign prpg_out_i\[124\] = prpg_out_i\[445\] ^ lfsrout\[179\];
  assign prpg_out_i\[125\] = prpg_out_i\[376\] ^ lfsrout\[42\];
  assign prpg_out_i\[126\] =lfsrout\[362\] ^ lfsrout\[391\];
  assign prpg_out_i\[127\] =lfsrout\[161\] ^ lfsrout\[202\];
  assign prpg_out_i\[128\] = prpg_out_i\[432\] ^ lfsrout\[182\];
  assign prpg_out_i\[129\] = prpg_out_i\[313\] ^ lfsrout\[17\];
  assign prpg_out_i\[130\] = prpg_out_i\[410\] ^ lfsrout\[209\];
  assign prpg_out_i\[131\] =lfsrout\[4\] ^ lfsrout\[439\];
  assign prpg_out_i\[132\] = prpg_out_i\[76\] ^ lfsrout\[14\];
  assign prpg_out_i\[133\] = prpg_out_i\[53\] ^ lfsrout\[33\];
  assign prpg_out_i\[134\] = prpg_out_i\[379\] ^ lfsrout\[95\];
  assign prpg_out_i\[135\] = prpg_out_i\[444\] ^ lfsrout\[161\];
  assign prpg_out_i\[136\] = prpg_out_i\[326\] ^ lfsrout\[70\];
  assign prpg_out_i\[137\] =lfsrout\[116\] ^ lfsrout\[430\];
  assign prpg_out_i\[138\] = prpg_out_i\[124\] ^ lfsrout\[60\];
  assign prpg_out_i\[139\] = prpg_out_i\[45\] ^ lfsrout\[370\];
  assign prpg_out_i\[140\] = prpg_out_i\[483\] ^ lfsrout\[23\];
  assign prpg_out_i\[141\] =lfsrout\[168\] ^ lfsrout\[405\];
  assign prpg_out_i\[142\] = prpg_out_i\[147\] ^ lfsrout\[30\];
  assign prpg_out_i\[143\] =lfsrout\[31\] ^ lfsrout\[330\];
  assign prpg_out_i\[144\] = prpg_out_i\[75\] ^ lfsrout\[270\];
  assign prpg_out_i\[145\] = prpg_out_i\[368\] ^ lfsrout\[162\];
  assign prpg_out_i\[146\] =lfsrout\[138\] ^ lfsrout\[203\];
  assign prpg_out_i\[147\] = prpg_out_i\[63\] ^ lfsrout\[284\];
  assign prpg_out_i\[148\] = prpg_out_i\[394\] ^ lfsrout\[72\];
  assign prpg_out_i\[149\] = prpg_out_i\[169\] ^ lfsrout\[400\];
  assign prpg_out_i\[150\] = prpg_out_i\[357\] ^ lfsrout\[349\];
  assign prpg_out_i\[151\] = prpg_out_i\[139\] ^ lfsrout\[185\];
  assign prpg_out_i\[152\] = prpg_out_i\[498\] ^ lfsrout\[292\];
  assign prpg_out_i\[153\] = prpg_out_i\[224\] ^ lfsrout\[193\];
  assign prpg_out_i\[154\] = prpg_out_i\[144\] ^ lfsrout\[19\];
  assign prpg_out_i\[155\] = prpg_out_i\[382\] ^ lfsrout\[125\];
  assign prpg_out_i\[156\] = prpg_out_i\[37\] ^ lfsrout\[95\];
  assign prpg_out_i\[157\] = prpg_out_i\[292\] ^ lfsrout\[164\];
  assign prpg_out_i\[158\] = prpg_out_i\[415\] ^ lfsrout\[386\];
  assign prpg_out_i\[159\] = prpg_out_i\[485\] ^ lfsrout\[415\];
  assign prpg_out_i\[160\] = prpg_out_i\[60\] ^ lfsrout\[51\];
  assign prpg_out_i\[161\] = prpg_out_i\[15\] ^ lfsrout\[55\];
  assign prpg_out_i\[162\] = prpg_out_i\[49\] ^ lfsrout\[410\];
  assign prpg_out_i\[163\] = prpg_out_i\[318\] ^ lfsrout\[215\];
  assign prpg_out_i\[164\] = prpg_out_i\[212\] ^ lfsrout\[302\];
  assign prpg_out_i\[165\] = prpg_out_i\[7\] ^ lfsrout\[226\];
  assign prpg_out_i\[166\] = prpg_out_i\[112\] ^ lfsrout\[324\];
  assign prpg_out_i\[167\] = prpg_out_i\[203\] ^ lfsrout\[46\];
  assign prpg_out_i\[168\] =lfsrout\[26\] ^ lfsrout\[205\];
  assign prpg_out_i\[169\] = prpg_out_i\[12\] ^ lfsrout\[321\];
  assign prpg_out_i\[170\] = prpg_out_i\[291\] ^ lfsrout\[264\];
  assign prpg_out_i\[171\] = prpg_out_i\[160\] ^ lfsrout\[27\];
  assign prpg_out_i\[172\] = prpg_out_i\[136\] ^ lfsrout\[0\];
  assign prpg_out_i\[173\] = prpg_out_i\[370\] ^ lfsrout\[335\];
  assign prpg_out_i\[174\] = prpg_out_i\[85\] ^ lfsrout\[228\];
  assign prpg_out_i\[175\] = prpg_out_i\[153\] ^ lfsrout\[336\];
  assign prpg_out_i\[176\] =lfsrout\[163\] ^ lfsrout\[310\];
  assign prpg_out_i\[177\] = prpg_out_i\[105\] ^ lfsrout\[130\];
  assign prpg_out_i\[178\] =lfsrout\[147\] ^ lfsrout\[445\];
  assign prpg_out_i\[179\] = prpg_out_i\[348\] ^ lfsrout\[354\];
  assign prpg_out_i\[180\] = prpg_out_i\[73\] ^ lfsrout\[358\];
  assign prpg_out_i\[181\] = prpg_out_i\[100\] ^ lfsrout\[109\];
  assign prpg_out_i\[182\] = prpg_out_i\[272\] ^ lfsrout\[227\];
  assign prpg_out_i\[183\] = prpg_out_i\[157\] ^ lfsrout\[82\];
  assign prpg_out_i\[184\] = prpg_out_i\[137\] ^ lfsrout\[363\];
  assign prpg_out_i\[185\] = prpg_out_i\[102\] ^ lfsrout\[186\];
  assign prpg_out_i\[186\] = prpg_out_i\[255\] ^ lfsrout\[278\];
  assign prpg_out_i\[187\] =lfsrout\[149\] ^ lfsrout\[218\];
  assign prpg_out_i\[188\] = prpg_out_i\[118\] ^ lfsrout\[81\];
  assign prpg_out_i\[189\] = prpg_out_i\[211\] ^ lfsrout\[336\];
  assign prpg_out_i\[190\] = prpg_out_i\[440\] ^ lfsrout\[155\];
  assign prpg_out_i\[191\] =lfsrout\[162\] ^ lfsrout\[243\];
  assign prpg_out_i\[192\] =lfsrout\[141\] ^ lfsrout\[349\];
  assign prpg_out_i\[193\] = prpg_out_i\[185\] ^ lfsrout\[110\];
  assign prpg_out_i\[194\] = prpg_out_i\[346\] ^ lfsrout\[329\];
  assign prpg_out_i\[195\] = prpg_out_i\[393\] ^ lfsrout\[272\];
  assign prpg_out_i\[196\] = prpg_out_i\[5\] ^ lfsrout\[96\];
  assign prpg_out_i\[197\] = prpg_out_i\[62\] ^ lfsrout\[6\];
  assign prpg_out_i\[198\] = prpg_out_i\[287\] ^ lfsrout\[73\];
  assign prpg_out_i\[199\] = prpg_out_i\[194\] ^ lfsrout\[404\];
  assign prpg_out_i\[200\] =lfsrout\[214\] ^ lfsrout\[439\];
  assign prpg_out_i\[201\] = prpg_out_i\[219\] ^ lfsrout\[465\];
  assign prpg_out_i\[202\] = prpg_out_i\[101\] ^ lfsrout\[317\];
  assign prpg_out_i\[203\] = prpg_out_i\[59\] ^ lfsrout\[220\];
  assign prpg_out_i\[204\] = prpg_out_i\[94\] ^ lfsrout\[138\];
  assign prpg_out_i\[205\] = prpg_out_i\[260\] ^ lfsrout\[273\];
  assign prpg_out_i\[206\] =lfsrout\[2\] ^ lfsrout\[436\];
  assign prpg_out_i\[207\] = prpg_out_i\[460\] ^ lfsrout\[217\];
  assign prpg_out_i\[208\] = prpg_out_i\[258\] ^ lfsrout\[126\];
  assign prpg_out_i\[209\] = prpg_out_i\[276\] ^ lfsrout\[274\];
  assign prpg_out_i\[210\] = prpg_out_i\[187\] ^ lfsrout\[463\];
  assign prpg_out_i\[211\] = prpg_out_i\[373\] ^ lfsrout\[193\];
  assign prpg_out_i\[212\] = prpg_out_i\[109\] ^ lfsrout\[125\];
  assign prpg_out_i\[213\] = prpg_out_i\[3\] ^ lfsrout\[139\];
  assign prpg_out_i\[214\] = prpg_out_i\[132\] ^ lfsrout\[431\];
  assign prpg_out_i\[215\] = prpg_out_i\[178\] ^ lfsrout\[229\];
  assign prpg_out_i\[216\] = prpg_out_i\[299\] ^ lfsrout\[180\];
  assign prpg_out_i\[217\] = prpg_out_i\[200\] ^ lfsrout\[399\];
  assign prpg_out_i\[218\] =lfsrout\[161\] ^ lfsrout\[343\];
  assign prpg_out_i\[219\] = prpg_out_i\[138\] ^ lfsrout\[451\];
  assign prpg_out_i\[220\] = prpg_out_i\[488\] ^ lfsrout\[13\];
  assign prpg_out_i\[221\] = prpg_out_i\[457\] ^ lfsrout\[146\];
  assign prpg_out_i\[222\] = prpg_out_i\[154\] ^ lfsrout\[249\];
  assign prpg_out_i\[223\] = prpg_out_i\[305\] ^ lfsrout\[167\];
  assign prpg_out_i\[224\] = prpg_out_i\[230\] ^ lfsrout\[3\];
  assign prpg_out_i\[225\] = prpg_out_i\[131\] ^ lfsrout\[21\];
  assign prpg_out_i\[226\] = prpg_out_i\[511\] ^ lfsrout\[253\];
  assign prpg_out_i\[227\] = prpg_out_i\[98\] ^ lfsrout\[316\];
  assign prpg_out_i\[228\] = prpg_out_i\[497\] ^ lfsrout\[102\];
  assign prpg_out_i\[229\] = prpg_out_i\[142\] ^ lfsrout\[15\];
  assign prpg_out_i\[230\] =lfsrout\[118\] ^ lfsrout\[340\];
  assign prpg_out_i\[231\] = prpg_out_i\[311\] ^ lfsrout\[309\];
  assign prpg_out_i\[232\] = prpg_out_i\[239\] ^ lfsrout\[460\];
  assign prpg_out_i\[233\] =lfsrout\[230\] ^ lfsrout\[452\];
  assign prpg_out_i\[234\] =lfsrout\[226\] ^ lfsrout\[404\];
  assign prpg_out_i\[235\] = prpg_out_i\[491\] ^ lfsrout\[178\];
  assign prpg_out_i\[236\] = prpg_out_i\[484\] ^ lfsrout\[448\];
  assign prpg_out_i\[237\] = prpg_out_i\[296\] ^ lfsrout\[111\];
  assign prpg_out_i\[238\] = prpg_out_i\[349\] ^ lfsrout\[72\];
  assign prpg_out_i\[239\] = prpg_out_i\[198\] ^ lfsrout\[276\];
  assign prpg_out_i\[240\] = prpg_out_i\[416\] ^ lfsrout\[303\];
  assign prpg_out_i\[241\] =lfsrout\[253\] ^ lfsrout\[305\];
  assign prpg_out_i\[242\] = prpg_out_i\[27\] ^ lfsrout\[188\];
  assign prpg_out_i\[243\] =lfsrout\[192\] ^ lfsrout\[475\];
  assign prpg_out_i\[244\] = prpg_out_i\[249\] ^ lfsrout\[265\];
  assign prpg_out_i\[245\] = prpg_out_i\[127\] ^ lfsrout\[160\];
  assign prpg_out_i\[246\] =lfsrout\[43\] ^ lfsrout\[347\];
  assign prpg_out_i\[247\] = prpg_out_i\[162\] ^ lfsrout\[416\];
  assign prpg_out_i\[248\] = prpg_out_i\[266\] ^ lfsrout\[276\];
  assign prpg_out_i\[249\] = prpg_out_i\[455\] ^ lfsrout\[51\];
  assign prpg_out_i\[250\] = prpg_out_i\[146\] ^ lfsrout\[319\];
  assign prpg_out_i\[251\] = prpg_out_i\[189\] ^ lfsrout\[136\];
  assign prpg_out_i\[252\] = prpg_out_i\[469\] ^ lfsrout\[22\];
  assign prpg_out_i\[253\] = prpg_out_i\[263\] ^ lfsrout\[326\];
  assign prpg_out_i\[254\] =lfsrout\[240\] ^ lfsrout\[249\];
  assign prpg_out_i\[255\] = prpg_out_i\[174\] ^ lfsrout\[77\];
  assign prpg_out_i\[256\] = prpg_out_i\[177\] ^ lfsrout\[145\];
  assign prpg_out_i\[257\] = prpg_out_i\[404\] ^ lfsrout\[307\];
  assign prpg_out_i\[258\] = prpg_out_i\[39\] ^ lfsrout\[252\];
  assign prpg_out_i\[259\] = prpg_out_i\[135\] ^ lfsrout\[320\];
  assign prpg_out_i\[260\] = prpg_out_i\[277\] ^ lfsrout\[59\];
  assign prpg_out_i\[261\] = prpg_out_i\[46\] ^ lfsrout\[6\];
  assign prpg_out_i\[262\] = prpg_out_i\[205\] ^ lfsrout\[85\];
  assign prpg_out_i\[263\] = prpg_out_i\[246\] ^ lfsrout\[173\];
  assign prpg_out_i\[264\] =lfsrout\[173\] ^ lfsrout\[237\];
  assign prpg_out_i\[265\] = prpg_out_i\[301\] ^ lfsrout\[166\];
  assign prpg_out_i\[266\] = prpg_out_i\[273\] ^ lfsrout\[73\];
  assign prpg_out_i\[267\] =lfsrout\[128\] ^ lfsrout\[182\];
  assign prpg_out_i\[268\] = prpg_out_i\[391\] ^ lfsrout\[34\];
  assign prpg_out_i\[269\] = prpg_out_i\[188\] ^ lfsrout\[205\];
  assign prpg_out_i\[270\] =lfsrout\[116\] ^ lfsrout\[202\];
  assign prpg_out_i\[271\] = prpg_out_i\[104\] ^ lfsrout\[444\];
  assign prpg_out_i\[272\] =lfsrout\[283\] ^ lfsrout\[290\];
  assign prpg_out_i\[273\] = prpg_out_i\[95\] ^ lfsrout\[203\];
  assign prpg_out_i\[274\] =lfsrout\[297\] ^ lfsrout\[375\];
  assign prpg_out_i\[275\] = prpg_out_i\[87\] ^ lfsrout\[154\];
  assign prpg_out_i\[276\] = prpg_out_i\[267\] ^ lfsrout\[69\];
  assign prpg_out_i\[277\] = prpg_out_i\[332\] ^ lfsrout\[329\];
  assign prpg_out_i\[278\] = prpg_out_i\[206\] ^ lfsrout\[458\];
  assign prpg_out_i\[279\] = prpg_out_i\[121\] ^ lfsrout\[274\];
  assign prpg_out_i\[280\] = prpg_out_i\[464\] ^ lfsrout\[355\];
  assign prpg_out_i\[281\] = prpg_out_i\[308\] ^ lfsrout\[444\];
  assign prpg_out_i\[282\] = prpg_out_i\[354\] ^ lfsrout\[272\];
  assign prpg_out_i\[283\] = prpg_out_i\[442\] ^ lfsrout\[469\];
  assign prpg_out_i\[284\] = prpg_out_i\[323\] ^ lfsrout\[57\];
  assign prpg_out_i\[285\] = prpg_out_i\[122\] ^ lfsrout\[111\];
  assign prpg_out_i\[286\] = prpg_out_i\[355\] ^ lfsrout\[326\];
  assign prpg_out_i\[287\] =lfsrout\[127\] ^ lfsrout\[253\];
  assign prpg_out_i\[288\] = prpg_out_i\[424\] ^ lfsrout\[223\];
  assign prpg_out_i\[289\] = prpg_out_i\[331\] ^ lfsrout\[135\];
  assign prpg_out_i\[290\] = prpg_out_i\[284\] ^ lfsrout\[268\];
  assign prpg_out_i\[291\] =lfsrout\[280\] ^ lfsrout\[326\];
  assign prpg_out_i\[292\] = prpg_out_i\[504\] ^ lfsrout\[399\];
  assign prpg_out_i\[293\] = prpg_out_i\[339\] ^ lfsrout\[111\];
  assign prpg_out_i\[294\] = prpg_out_i\[324\] ^ lfsrout\[306\];
  assign prpg_out_i\[295\] = prpg_out_i\[38\] ^ lfsrout\[292\];
  assign prpg_out_i\[296\] = prpg_out_i\[271\] ^ lfsrout\[222\];
  assign prpg_out_i\[297\] = prpg_out_i\[322\] ^ lfsrout\[459\];
  assign prpg_out_i\[298\] = prpg_out_i\[183\] ^ lfsrout\[434\];
  assign prpg_out_i\[299\] = prpg_out_i\[447\] ^ lfsrout\[295\];
  assign prpg_out_i\[300\] =lfsrout\[147\] ^ lfsrout\[211\];
  assign prpg_out_i\[301\] =lfsrout\[28\] ^ lfsrout\[245\];
  assign prpg_out_i\[302\] = prpg_out_i\[366\] ^ lfsrout\[154\];
  assign prpg_out_i\[303\] = prpg_out_i\[473\] ^ lfsrout\[418\];
  assign prpg_out_i\[304\] = prpg_out_i\[195\] ^ lfsrout\[474\];
  assign prpg_out_i\[305\] = prpg_out_i\[202\] ^ lfsrout\[258\];
  assign prpg_out_i\[306\] = prpg_out_i\[481\] ^ lfsrout\[390\];
  assign prpg_out_i\[307\] = prpg_out_i\[236\] ^ lfsrout\[275\];
  assign prpg_out_i\[308\] = prpg_out_i\[155\] ^ lfsrout\[303\];
  assign prpg_out_i\[309\] = prpg_out_i\[152\] ^ lfsrout\[176\];
  assign prpg_out_i\[310\] = prpg_out_i\[240\] ^ lfsrout\[391\];
  assign prpg_out_i\[311\] =lfsrout\[146\] ^ lfsrout\[266\];
  assign prpg_out_i\[312\] = prpg_out_i\[302\] ^ lfsrout\[159\];
  assign prpg_out_i\[313\] = prpg_out_i\[31\] ^ lfsrout\[464\];
  assign prpg_out_i\[314\] = prpg_out_i\[238\] ^ lfsrout\[36\];
  assign prpg_out_i\[315\] = prpg_out_i\[93\] ^ lfsrout\[399\];
  assign prpg_out_i\[316\] = prpg_out_i\[369\] ^ lfsrout\[399\];
  assign prpg_out_i\[317\] = prpg_out_i\[164\] ^ lfsrout\[80\];
  assign prpg_out_i\[318\] = prpg_out_i\[61\] ^ lfsrout\[271\];
  assign prpg_out_i\[319\] = prpg_out_i\[22\] ^ lfsrout\[401\];
  assign prpg_out_i\[320\] = prpg_out_i\[344\] ^ lfsrout\[259\];
  assign prpg_out_i\[321\] = prpg_out_i\[110\] ^ lfsrout\[456\];
  assign prpg_out_i\[322\] =lfsrout\[150\] ^ lfsrout\[405\];
  assign prpg_out_i\[323\] = prpg_out_i\[378\] ^ lfsrout\[337\];
  assign prpg_out_i\[324\] = prpg_out_i\[134\] ^ lfsrout\[156\];
  assign prpg_out_i\[325\] =lfsrout\[21\] ^ lfsrout\[152\];
  assign prpg_out_i\[326\] = prpg_out_i\[395\] ^ lfsrout\[140\];
  assign prpg_out_i\[327\] =lfsrout\[368\] ^ lfsrout\[413\];
  assign prpg_out_i\[328\] = prpg_out_i\[419\] ^ lfsrout\[92\];
  assign prpg_out_i\[329\] =lfsrout\[282\] ^ lfsrout\[462\];
  assign prpg_out_i\[330\] =lfsrout\[74\] ^ lfsrout\[240\];
  assign prpg_out_i\[331\] = prpg_out_i\[13\] ^ lfsrout\[270\];
  assign prpg_out_i\[332\] = prpg_out_i\[300\] ^ lfsrout\[477\];
  assign prpg_out_i\[333\] = prpg_out_i\[407\] ^ lfsrout\[362\];
  assign prpg_out_i\[334\] =lfsrout\[368\] ^ lfsrout\[401\];
  assign prpg_out_i\[335\] = prpg_out_i\[503\] ^ lfsrout\[400\];
  assign prpg_out_i\[336\] = prpg_out_i\[510\] ^ lfsrout\[190\];
  assign prpg_out_i\[337\] = prpg_out_i\[220\] ^ lfsrout\[426\];
  assign prpg_out_i\[338\] = prpg_out_i\[235\] ^ lfsrout\[317\];
  assign prpg_out_i\[339\] = prpg_out_i\[507\] ^ lfsrout\[222\];
  assign prpg_out_i\[340\] = prpg_out_i\[151\] ^ lfsrout\[332\];
  assign prpg_out_i\[341\] = prpg_out_i\[353\] ^ lfsrout\[195\];
  assign prpg_out_i\[342\] =lfsrout\[444\] ^ lfsrout\[452\];
  assign prpg_out_i\[343\] =lfsrout\[171\] ^ lfsrout\[433\];
  assign prpg_out_i\[344\] = prpg_out_i\[74\] ^ lfsrout\[454\];
  assign prpg_out_i\[345\] = prpg_out_i\[149\] ^ lfsrout\[461\];
  assign prpg_out_i\[346\] = prpg_out_i\[92\] ^ lfsrout\[476\];
  assign prpg_out_i\[347\] = prpg_out_i\[363\] ^ lfsrout\[381\];
  assign prpg_out_i\[348\] = prpg_out_i\[278\] ^ lfsrout\[229\];
  assign prpg_out_i\[349\] = prpg_out_i\[446\] ^ lfsrout\[144\];
  assign prpg_out_i\[350\] = prpg_out_i\[399\] ^ lfsrout\[201\];
  assign prpg_out_i\[351\] = prpg_out_i\[233\] ^ lfsrout\[474\];
  assign prpg_out_i\[352\] = prpg_out_i\[231\] ^ lfsrout\[394\];
  assign prpg_out_i\[353\] =lfsrout\[189\] ^ lfsrout\[214\];
  assign prpg_out_i\[354\] = prpg_out_i\[265\] ^ lfsrout\[363\];
  assign prpg_out_i\[355\] = prpg_out_i\[330\] ^ lfsrout\[468\];
  assign prpg_out_i\[356\] = prpg_out_i\[423\] ^ lfsrout\[99\];
  assign prpg_out_i\[357\] = prpg_out_i\[286\] ^ lfsrout\[163\];
  assign prpg_out_i\[358\] = prpg_out_i\[32\] ^ lfsrout\[426\];
  assign prpg_out_i\[359\] = prpg_out_i\[99\] ^ lfsrout\[28\];
  assign prpg_out_i\[360\] = prpg_out_i\[44\] ^ lfsrout\[84\];
  assign prpg_out_i\[361\] = prpg_out_i\[179\] ^ lfsrout\[20\];
  assign prpg_out_i\[362\] = prpg_out_i\[429\] ^ lfsrout\[193\];
  assign prpg_out_i\[363\] =lfsrout\[192\] ^ lfsrout\[374\];
  assign prpg_out_i\[364\] = prpg_out_i\[71\] ^ lfsrout\[122\];
  assign prpg_out_i\[365\] = prpg_out_i\[288\] ^ lfsrout\[56\];
  assign prpg_out_i\[366\] = prpg_out_i\[168\] ^ lfsrout\[308\];
  assign prpg_out_i\[367\] = prpg_out_i\[414\] ^ lfsrout\[420\];
  assign prpg_out_i\[368\] = prpg_out_i\[383\] ^ lfsrout\[233\];
  assign prpg_out_i\[369\] = prpg_out_i\[216\] ^ lfsrout\[90\];
  assign prpg_out_i\[370\] = prpg_out_i\[232\] ^ lfsrout\[191\];
  assign prpg_out_i\[371\] = prpg_out_i\[362\] ^ lfsrout\[337\];
  assign prpg_out_i\[372\] =lfsrout\[42\] ^ lfsrout\[263\];
  assign prpg_out_i\[373\] = prpg_out_i\[374\] ^ lfsrout\[386\];
  assign prpg_out_i\[374\] = prpg_out_i\[486\] ^ lfsrout\[293\];
  assign prpg_out_i\[375\] = prpg_out_i\[199\] ^ lfsrout\[202\];
  assign prpg_out_i\[376\] = prpg_out_i\[365\] ^ lfsrout\[28\];
  assign prpg_out_i\[377\] = prpg_out_i\[24\] ^ lfsrout\[402\];
  assign prpg_out_i\[378\] = prpg_out_i\[342\] ^ lfsrout\[195\];
  assign prpg_out_i\[379\] =lfsrout\[380\] ^ lfsrout\[469\];
  assign prpg_out_i\[380\] = prpg_out_i\[487\] ^ lfsrout\[346\];
  assign prpg_out_i\[381\] = prpg_out_i\[6\] ^ lfsrout\[19\];
  assign prpg_out_i\[382\] = prpg_out_i\[225\] ^ lfsrout\[250\];
  assign prpg_out_i\[383\] = prpg_out_i\[392\] ^ lfsrout\[466\];
  assign prpg_out_i\[384\] = prpg_out_i\[412\] ^ lfsrout\[139\];
  assign prpg_out_i\[385\] =lfsrout\[294\] ^ lfsrout\[397\];
  assign prpg_out_i\[386\] = prpg_out_i\[450\] ^ lfsrout\[170\];
  assign prpg_out_i\[387\] = prpg_out_i\[459\] ^ lfsrout\[386\];
  assign prpg_out_i\[388\] = prpg_out_i\[309\] ^ lfsrout\[11\];
  assign prpg_out_i\[389\] = prpg_out_i\[476\] ^ lfsrout\[211\];
  assign prpg_out_i\[390\] =lfsrout\[106\] ^ lfsrout\[122\];
  assign prpg_out_i\[391\] = prpg_out_i\[117\] ^ lfsrout\[68\];
  assign prpg_out_i\[392\] =lfsrout\[385\] ^ lfsrout\[392\];
  assign prpg_out_i\[393\] = prpg_out_i\[402\] ^ lfsrout\[49\];
  assign prpg_out_i\[394\] = prpg_out_i\[385\] ^ lfsrout\[144\];
  assign prpg_out_i\[395\] = prpg_out_i\[443\] ^ lfsrout\[267\];
  assign prpg_out_i\[396\] =lfsrout\[369\] ^ lfsrout\[424\];
  assign prpg_out_i\[397\] = prpg_out_i\[190\] ^ lfsrout\[317\];
  assign prpg_out_i\[398\] = prpg_out_i\[222\] ^ lfsrout\[364\];
  assign prpg_out_i\[399\] = prpg_out_i\[217\] ^ lfsrout\[402\];
  assign prpg_out_i\[400\] = prpg_out_i\[453\] ^ lfsrout\[112\];
  assign prpg_out_i\[401\] = prpg_out_i\[176\] ^ lfsrout\[262\];
  assign prpg_out_i\[402\] =lfsrout\[46\] ^ lfsrout\[176\];
  assign prpg_out_i\[403\] = prpg_out_i\[320\] ^ lfsrout\[369\];
  assign prpg_out_i\[404\] = prpg_out_i\[280\] ^ lfsrout\[135\];
  assign prpg_out_i\[405\] = prpg_out_i\[245\] ^ lfsrout\[80\];
  assign prpg_out_i\[406\] = prpg_out_i\[201\] ^ lfsrout\[184\];
  assign prpg_out_i\[407\] = prpg_out_i\[470\] ^ lfsrout\[245\];
  assign prpg_out_i\[408\] =lfsrout\[375\] ^ lfsrout\[406\];
  assign prpg_out_i\[409\] = prpg_out_i\[18\] ^ lfsrout\[368\];
  assign prpg_out_i\[410\] =lfsrout\[232\] ^ lfsrout\[245\];
  assign prpg_out_i\[411\] = prpg_out_i\[207\] ^ lfsrout\[203\];
  assign prpg_out_i\[412\] = prpg_out_i\[303\] ^ lfsrout\[278\];
  assign prpg_out_i\[413\] = prpg_out_i\[247\] ^ lfsrout\[208\];
  assign prpg_out_i\[414\] = prpg_out_i\[474\] ^ lfsrout\[361\];
  assign prpg_out_i\[415\] = prpg_out_i\[264\] ^ lfsrout\[272\];
  assign prpg_out_i\[416\] = prpg_out_i\[428\] ^ lfsrout\[464\];
  assign prpg_out_i\[417\] =lfsrout\[59\] ^ lfsrout\[144\];
  assign prpg_out_i\[418\] = prpg_out_i\[126\] ^ lfsrout\[339\];
  assign prpg_out_i\[419\] =lfsrout\[262\] ^ lfsrout\[471\];
  assign prpg_out_i\[420\] = prpg_out_i\[434\] ^ lfsrout\[85\];
  assign prpg_out_i\[421\] = prpg_out_i\[88\] ^ lfsrout\[336\];
  assign prpg_out_i\[422\] = prpg_out_i\[248\] ^ lfsrout\[138\];
  assign prpg_out_i\[423\] = prpg_out_i\[182\] ^ lfsrout\[198\];
  assign prpg_out_i\[424\] = prpg_out_i\[472\] ^ lfsrout\[446\];
  assign prpg_out_i\[425\] = prpg_out_i\[11\] ^ lfsrout\[120\];
  assign prpg_out_i\[426\] = prpg_out_i\[420\] ^ lfsrout\[282\];
  assign prpg_out_i\[427\] = prpg_out_i\[360\] ^ lfsrout\[42\];
  assign prpg_out_i\[428\] =lfsrout\[206\] ^ lfsrout\[463\];
  assign prpg_out_i\[429\] =lfsrout\[259\] ^ lfsrout\[301\];
  assign prpg_out_i\[430\] = prpg_out_i\[19\] ^ lfsrout\[106\];
  assign prpg_out_i\[431\] = prpg_out_i\[509\] ^ lfsrout\[182\];
  assign prpg_out_i\[432\] =lfsrout\[1\] ^ lfsrout\[241\];
  assign prpg_out_i\[433\] = prpg_out_i\[70\] ^ lfsrout\[366\];
  assign prpg_out_i\[434\] = prpg_out_i\[209\] ^ lfsrout\[170\];
  assign prpg_out_i\[435\] = prpg_out_i\[364\] ^ lfsrout\[469\];
  assign prpg_out_i\[436\] = prpg_out_i\[433\] ^ lfsrout\[183\];
  assign prpg_out_i\[437\] =lfsrout\[201\] ^ lfsrout\[464\];
  assign prpg_out_i\[438\] = prpg_out_i\[461\] ^ lfsrout\[266\];
  assign prpg_out_i\[439\] = prpg_out_i\[8\] ^ lfsrout\[193\];
  assign prpg_out_i\[440\] = prpg_out_i\[192\] ^ lfsrout\[310\];
  assign prpg_out_i\[441\] =lfsrout\[79\] ^ lfsrout\[125\];
  assign prpg_out_i\[442\] = prpg_out_i\[270\] ^ lfsrout\[459\];
  assign prpg_out_i\[443\] = prpg_out_i\[241\] ^ lfsrout\[55\];
  assign prpg_out_i\[444\] = prpg_out_i\[56\] ^ lfsrout\[322\];
  assign prpg_out_i\[445\] =lfsrout\[3\] ^ lfsrout\[425\];
  assign prpg_out_i\[446\] = prpg_out_i\[466\] ^ lfsrout\[73\];
  assign prpg_out_i\[447\] =lfsrout\[212\] ^ lfsrout\[429\];
  assign prpg_out_i\[448\] = prpg_out_i\[4\] ^ lfsrout\[199\];
  assign prpg_out_i\[449\] = prpg_out_i\[317\] ^ lfsrout\[340\];
  assign prpg_out_i\[450\] = prpg_out_i\[350\] ^ lfsrout\[340\];
  assign prpg_out_i\[451\] = prpg_out_i\[274\] ^ lfsrout\[366\];
  assign prpg_out_i\[452\] = prpg_out_i\[502\] ^ lfsrout\[189\];
  assign prpg_out_i\[453\] = prpg_out_i\[458\] ^ lfsrout\[224\];
  assign prpg_out_i\[454\] = prpg_out_i\[41\] ^ lfsrout\[392\];
  assign prpg_out_i\[455\] =lfsrout\[241\] ^ lfsrout\[462\];
  assign prpg_out_i\[456\] = prpg_out_i\[91\] ^ lfsrout\[313\];
  assign prpg_out_i\[457\] = prpg_out_i\[66\] ^ lfsrout\[292\];
  assign prpg_out_i\[458\] = prpg_out_i\[143\] ^ lfsrout\[175\];
  assign prpg_out_i\[459\] = prpg_out_i\[55\] ^ lfsrout\[412\];
  assign prpg_out_i\[460\] = prpg_out_i\[89\] ^ lfsrout\[93\];
  assign prpg_out_i\[461\] = prpg_out_i\[333\] ^ lfsrout\[53\];
  assign prpg_out_i\[462\] = prpg_out_i\[282\] ^ lfsrout\[136\];
  assign prpg_out_i\[463\] = prpg_out_i\[58\] ^ lfsrout\[453\];
  assign prpg_out_i\[464\] = prpg_out_i\[495\] ^ lfsrout\[362\];
  assign prpg_out_i\[465\] = prpg_out_i\[210\] ^ lfsrout\[471\];
  assign prpg_out_i\[466\] = prpg_out_i\[334\] ^ lfsrout\[146\];
  assign prpg_out_i\[467\] =lfsrout\[5\] ^ lfsrout\[204\];
  assign prpg_out_i\[468\] = prpg_out_i\[413\] ^ lfsrout\[396\];
  assign prpg_out_i\[469\] = prpg_out_i\[295\] ^ lfsrout\[170\];
  assign prpg_out_i\[470\] =lfsrout\[355\] ^ lfsrout\[436\];
  assign prpg_out_i\[471\] = prpg_out_i\[290\] ^ lfsrout\[418\];
  assign prpg_out_i\[472\] =lfsrout\[255\] ^ lfsrout\[423\];
  assign prpg_out_i\[473\] = prpg_out_i\[401\] ^ lfsrout\[362\];
  assign prpg_out_i\[474\] = prpg_out_i\[405\] ^ lfsrout\[231\];
  assign prpg_out_i\[475\] = prpg_out_i\[107\] ^ lfsrout\[421\];
  assign prpg_out_i\[476\] = prpg_out_i\[79\] ^ lfsrout\[422\];
  assign prpg_out_i\[477\] = prpg_out_i\[67\] ^ lfsrout\[431\];
  assign prpg_out_i\[478\] = prpg_out_i\[377\] ^ lfsrout\[201\];
  assign prpg_out_i\[479\] = prpg_out_i\[54\] ^ lfsrout\[35\];
  assign prpg_out_i\[480\] = prpg_out_i\[477\] ^ lfsrout\[455\];
  assign prpg_out_i\[481\] = prpg_out_i\[140\] ^ lfsrout\[251\];
  assign prpg_out_i\[482\] = prpg_out_i\[441\] ^ lfsrout\[336\];
  assign prpg_out_i\[483\] = prpg_out_i\[28\] ^ lfsrout\[46\];
  assign prpg_out_i\[484\] = prpg_out_i\[452\] ^ lfsrout\[417\];
  assign prpg_out_i\[485\] = prpg_out_i\[492\] ^ lfsrout\[351\];
  assign prpg_out_i\[486\] =lfsrout\[217\] ^ lfsrout\[261\];
  assign prpg_out_i\[487\] = prpg_out_i\[283\] ^ lfsrout\[213\];
  assign prpg_out_i\[488\] = prpg_out_i\[83\] ^ lfsrout\[177\];
  assign prpg_out_i\[489\] = prpg_out_i\[327\] ^ lfsrout\[137\];
  assign prpg_out_i\[490\] = prpg_out_i\[16\] ^ lfsrout\[439\];
  assign prpg_out_i\[491\] = prpg_out_i\[84\] ^ lfsrout\[356\];
  assign prpg_out_i\[492\] = prpg_out_i\[268\] ^ lfsrout\[17\];
  assign prpg_out_i\[493\] =lfsrout\[12\] ^ lfsrout\[331\];
  assign prpg_out_i\[494\] = prpg_out_i\[170\] ^ lfsrout\[132\];
  assign prpg_out_i\[495\] = prpg_out_i\[493\] ^ lfsrout\[245\];
  assign prpg_out_i\[496\] = prpg_out_i\[35\] ^ lfsrout\[449\];
  assign prpg_out_i\[497\] = prpg_out_i\[114\] ^ lfsrout\[204\];
  assign prpg_out_i\[498\] = prpg_out_i\[47\] ^ lfsrout\[105\];
  assign prpg_out_i\[499\] = prpg_out_i\[431\] ^ lfsrout\[91\];
  assign prpg_out_i\[500\] = prpg_out_i\[128\] ^ lfsrout\[91\];
  assign prpg_out_i\[501\] = prpg_out_i\[436\] ^ lfsrout\[271\];
  assign prpg_out_i\[502\] = prpg_out_i\[254\] ^ lfsrout\[378\];
  assign prpg_out_i\[503\] = prpg_out_i\[130\] ^ lfsrout\[321\];
  assign prpg_out_i\[504\] = prpg_out_i\[467\] ^ lfsrout\[198\];
  assign prpg_out_i\[505\] = prpg_out_i\[479\] ^ lfsrout\[406\];
  assign prpg_out_i\[506\] = prpg_out_i\[275\] ^ lfsrout\[77\];
  assign prpg_out_i\[507\] =lfsrout\[266\] ^ lfsrout\[474\];
  assign prpg_out_i\[508\] =lfsrout\[347\] ^ lfsrout\[386\];
  assign prpg_out_i\[509\] = prpg_out_i\[65\] ^ lfsrout\[364\];
  assign prpg_out_i\[510\] = prpg_out_i\[145\] ^ lfsrout\[380\];
  assign prpg_out_i\[511\] = prpg_out_i\[289\] ^ lfsrout\[27\];

endmodule"
}

if { $prpg_length == 257 } {
    puts "
//------------------------------------------------------------------
// Phase shifter block definition 257 -> 512
//------------------------------------------------------------------"

    puts "module DFT_shifter_[expr $chain_count]_257_512\ (lfsrout, prpg_out\);
input \[256:0\] lfsrout;
output \[[expr $chain_count-1]:0\] prpg_out;
wire \[511:0\] prpg_out_i;

assign prpg_out\[[expr $chain_count-1]:0\] = prpg_out_i\[[expr $chain_count-1]:0\];

assign prpg_out_i\[0\] =  prpg_out_i\[389\] ^  lfsrout\[227\];
assign prpg_out_i\[1\] =  prpg_out_i\[214\] ^  lfsrout\[191\];
assign prpg_out_i\[2\] =  prpg_out_i\[294\] ^  lfsrout\[174\];
assign prpg_out_i\[3\] =  prpg_out_i\[11\] ^  lfsrout\[144\];
assign prpg_out_i\[4\] =  lfsrout\[16\] ^  lfsrout\[93\];
assign prpg_out_i\[5\] =  prpg_out_i\[428\] ^  lfsrout\[94\];
assign prpg_out_i\[6\] =  lfsrout\[65\] ^  lfsrout\[212\];
assign prpg_out_i\[7\] =  prpg_out_i\[180\] ^  lfsrout\[99\];
assign prpg_out_i\[8\] =  prpg_out_i\[190\] ^  lfsrout\[162\];
assign prpg_out_i\[9\] =  prpg_out_i\[418\] ^  lfsrout\[130\];
assign prpg_out_i\[10\] =  lfsrout\[49\] ^  lfsrout\[116\];
assign prpg_out_i\[11\] =  prpg_out_i\[128\] ^  lfsrout\[225\];
assign prpg_out_i\[12\] =  prpg_out_i\[40\] ^  lfsrout\[96\];
assign prpg_out_i\[13\] =  prpg_out_i\[229\] ^  lfsrout\[82\];
assign prpg_out_i\[14\] =  prpg_out_i\[97\] ^  lfsrout\[186\];
assign prpg_out_i\[15\] =  prpg_out_i\[366\] ^  lfsrout\[191\];
assign prpg_out_i\[16\] =  prpg_out_i\[53\] ^  lfsrout\[242\];
assign prpg_out_i\[17\] =  prpg_out_i\[208\] ^  lfsrout\[35\];
assign prpg_out_i\[18\] =  prpg_out_i\[61\] ^  lfsrout\[235\];
assign prpg_out_i\[19\] =  prpg_out_i\[317\] ^  lfsrout\[231\];
assign prpg_out_i\[20\] =  prpg_out_i\[367\] ^  lfsrout\[181\];
assign prpg_out_i\[21\] =  prpg_out_i\[164\] ^  lfsrout\[15\];
assign prpg_out_i\[22\] =  prpg_out_i\[145\] ^  lfsrout\[103\];
assign prpg_out_i\[23\] =  lfsrout\[54\] ^  lfsrout\[117\];
assign prpg_out_i\[24\] =  lfsrout\[128\] ^  lfsrout\[224\];
assign prpg_out_i\[25\] =  lfsrout\[61\] ^  lfsrout\[131\];
assign prpg_out_i\[26\] =  prpg_out_i\[472\] ^  lfsrout\[185\];
assign prpg_out_i\[27\] =  prpg_out_i\[355\] ^  lfsrout\[64\];
assign prpg_out_i\[28\] =  lfsrout\[75\] ^  lfsrout\[186\];
assign prpg_out_i\[29\] =  lfsrout\[158\] ^  lfsrout\[182\];
assign prpg_out_i\[30\] =  prpg_out_i\[118\] ^  lfsrout\[144\];
assign prpg_out_i\[31\] =  prpg_out_i\[503\] ^  lfsrout\[172\];
assign prpg_out_i\[32\] =  lfsrout\[13\] ^  lfsrout\[127\];
assign prpg_out_i\[33\] =  prpg_out_i\[269\] ^  lfsrout\[187\];
assign prpg_out_i\[34\] =  prpg_out_i\[352\] ^  lfsrout\[163\];
assign prpg_out_i\[35\] =  lfsrout\[27\] ^  lfsrout\[105\];
assign prpg_out_i\[36\] =  prpg_out_i\[42\] ^  lfsrout\[250\];
assign prpg_out_i\[37\] =  prpg_out_i\[381\] ^  lfsrout\[160\];
assign prpg_out_i\[38\] =  prpg_out_i\[220\] ^  lfsrout\[57\];
assign prpg_out_i\[39\] =  prpg_out_i\[21\] ^  lfsrout\[136\];
assign prpg_out_i\[40\] =  prpg_out_i\[439\] ^  lfsrout\[192\];
assign prpg_out_i\[41\] =  prpg_out_i\[108\] ^  lfsrout\[93\];
assign prpg_out_i\[42\] =  prpg_out_i\[338\] ^  lfsrout\[243\];
assign prpg_out_i\[43\] =  prpg_out_i\[26\] ^  lfsrout\[40\];
assign prpg_out_i\[44\] =  prpg_out_i\[373\] ^  lfsrout\[104\];
assign prpg_out_i\[45\] =  prpg_out_i\[221\] ^  lfsrout\[91\];
assign prpg_out_i\[46\] =  prpg_out_i\[479\] ^  lfsrout\[227\];
assign prpg_out_i\[47\] =  lfsrout\[80\] ^  lfsrout\[115\];
assign prpg_out_i\[48\] =  lfsrout\[89\] ^  lfsrout\[175\];
assign prpg_out_i\[49\] =  prpg_out_i\[238\] ^  lfsrout\[209\];
assign prpg_out_i\[50\] =  prpg_out_i\[12\] ^  lfsrout\[48\];
assign prpg_out_i\[51\] =  prpg_out_i\[189\] ^  lfsrout\[57\];
assign prpg_out_i\[52\] =  prpg_out_i\[456\] ^  lfsrout\[106\];
assign prpg_out_i\[53\] =  prpg_out_i\[415\] ^  lfsrout\[227\];
assign prpg_out_i\[54\] =  prpg_out_i\[223\] ^  lfsrout\[24\];
assign prpg_out_i\[55\] =  prpg_out_i\[399\] ^  lfsrout\[255\];
assign prpg_out_i\[56\] =  prpg_out_i\[235\] ^  lfsrout\[205\];
assign prpg_out_i\[57\] =  lfsrout\[36\] ^  lfsrout\[60\];
assign prpg_out_i\[58\] =  prpg_out_i\[287\] ^  lfsrout\[143\];
assign prpg_out_i\[59\] =  prpg_out_i\[140\] ^  lfsrout\[102\];
assign prpg_out_i\[60\] =  prpg_out_i\[261\] ^  lfsrout\[81\];
assign prpg_out_i\[61\] =  prpg_out_i\[460\] ^  lfsrout\[213\];
assign prpg_out_i\[62\] =  prpg_out_i\[213\] ^  lfsrout\[247\];
assign prpg_out_i\[63\] =  prpg_out_i\[236\] ^  lfsrout\[110\];
assign prpg_out_i\[64\] =  prpg_out_i\[316\] ^  lfsrout\[56\];
assign prpg_out_i\[65\] =  prpg_out_i\[303\] ^  lfsrout\[67\];
assign prpg_out_i\[66\] =  prpg_out_i\[117\] ^  lfsrout\[241\];
assign prpg_out_i\[67\] =  prpg_out_i\[66\] ^  lfsrout\[48\];
assign prpg_out_i\[68\] =  prpg_out_i\[3\] ^  lfsrout\[72\];
assign prpg_out_i\[69\] =  prpg_out_i\[487\] ^  lfsrout\[98\];
assign prpg_out_i\[70\] =  lfsrout\[74\] ^  lfsrout\[206\];
assign prpg_out_i\[71\] =  prpg_out_i\[398\] ^  lfsrout\[200\];
assign prpg_out_i\[72\] =  lfsrout\[2\] ^  lfsrout\[133\];
assign prpg_out_i\[73\] =  prpg_out_i\[161\] ^  lfsrout\[176\];
assign prpg_out_i\[74\] =  prpg_out_i\[475\] ^  lfsrout\[50\];
assign prpg_out_i\[75\] =  prpg_out_i\[256\] ^  lfsrout\[122\];
assign prpg_out_i\[76\] =  prpg_out_i\[443\] ^  lfsrout\[88\];
assign prpg_out_i\[77\] =  prpg_out_i\[245\] ^  lfsrout\[240\];
assign prpg_out_i\[78\] =  prpg_out_i\[480\] ^  lfsrout\[219\];
assign prpg_out_i\[79\] =  prpg_out_i\[14\] ^  lfsrout\[71\];
assign prpg_out_i\[80\] =  prpg_out_i\[328\] ^  lfsrout\[172\];
assign prpg_out_i\[81\] =  prpg_out_i\[486\] ^  lfsrout\[244\];
assign prpg_out_i\[82\] =  prpg_out_i\[10\] ^  lfsrout\[236\];
assign prpg_out_i\[83\] =  prpg_out_i\[33\] ^  lfsrout\[72\];
assign prpg_out_i\[84\] =  prpg_out_i\[454\] ^  lfsrout\[35\];
assign prpg_out_i\[85\] =  prpg_out_i\[38\] ^  lfsrout\[193\];
assign prpg_out_i\[86\] =  prpg_out_i\[170\] ^  lfsrout\[239\];
assign prpg_out_i\[87\] =  prpg_out_i\[139\] ^  lfsrout\[164\];
assign prpg_out_i\[88\] =  prpg_out_i\[47\] ^  lfsrout\[186\];
assign prpg_out_i\[89\] =  prpg_out_i\[129\] ^  lfsrout\[192\];
assign prpg_out_i\[90\] =  prpg_out_i\[200\] ^  lfsrout\[24\];
assign prpg_out_i\[91\] =  lfsrout\[43\] ^  lfsrout\[126\];
assign prpg_out_i\[92\] =  lfsrout\[8\] ^  lfsrout\[235\];
assign prpg_out_i\[93\] =  prpg_out_i\[101\] ^  lfsrout\[90\];
assign prpg_out_i\[94\] =  prpg_out_i\[324\] ^  lfsrout\[239\];
assign prpg_out_i\[95\] =  prpg_out_i\[374\] ^  lfsrout\[123\];
assign prpg_out_i\[96\] =  prpg_out_i\[436\] ^  lfsrout\[174\];
assign prpg_out_i\[97\] =  lfsrout\[18\] ^  lfsrout\[231\];
assign prpg_out_i\[98\] =  lfsrout\[68\] ^  lfsrout\[220\];
assign prpg_out_i\[99\] =  prpg_out_i\[332\] ^  lfsrout\[60\];
assign prpg_out_i\[100\] =  prpg_out_i\[462\] ^  lfsrout\[134\];
assign prpg_out_i\[101\] =  lfsrout\[61\] ^  lfsrout\[179\];
assign prpg_out_i\[102\] =  lfsrout\[68\] ^  lfsrout\[132\];
assign prpg_out_i\[103\] =  lfsrout\[61\] ^  lfsrout\[230\];
assign prpg_out_i\[104\] =  prpg_out_i\[54\] ^  lfsrout\[243\];
assign prpg_out_i\[105\] =  prpg_out_i\[237\] ^  lfsrout\[96\];
assign prpg_out_i\[106\] =  prpg_out_i\[363\] ^  lfsrout\[50\];
assign prpg_out_i\[107\] =  prpg_out_i\[485\] ^  lfsrout\[180\];
assign prpg_out_i\[108\] =  prpg_out_i\[74\] ^  lfsrout\[67\];
assign prpg_out_i\[109\] =  prpg_out_i\[414\] ^  lfsrout\[30\];
assign prpg_out_i\[110\] =  prpg_out_i\[375\] ^  lfsrout\[178\];
assign prpg_out_i\[111\] =  prpg_out_i\[169\] ^  lfsrout\[134\];
assign prpg_out_i\[112\] =  prpg_out_i\[312\] ^  lfsrout\[224\];
assign prpg_out_i\[113\] =  lfsrout\[183\] ^  lfsrout\[200\];
assign prpg_out_i\[114\] =  prpg_out_i\[461\] ^  lfsrout\[243\];
assign prpg_out_i\[115\] =  lfsrout\[82\] ^  lfsrout\[229\];
assign prpg_out_i\[116\] =  lfsrout\[12\] ^  lfsrout\[207\];
assign prpg_out_i\[117\] =  prpg_out_i\[471\] ^  lfsrout\[252\];
assign prpg_out_i\[118\] =  lfsrout\[71\] ^  lfsrout\[203\];
assign prpg_out_i\[119\] =  prpg_out_i\[277\] ^  lfsrout\[85\];
assign prpg_out_i\[120\] =  prpg_out_i\[201\] ^  lfsrout\[70\];
assign prpg_out_i\[121\] =  prpg_out_i\[358\] ^  lfsrout\[206\];
assign prpg_out_i\[122\] =  lfsrout\[91\] ^  lfsrout\[160\];
assign prpg_out_i\[123\] =  prpg_out_i\[186\] ^  lfsrout\[189\];
assign prpg_out_i\[124\] =  prpg_out_i\[30\] ^  lfsrout\[72\];
assign prpg_out_i\[125\] =  prpg_out_i\[65\] ^  lfsrout\[162\];
assign prpg_out_i\[126\] =  lfsrout\[32\] ^  lfsrout\[116\];
assign prpg_out_i\[127\] =  prpg_out_i\[379\] ^  lfsrout\[231\];
assign prpg_out_i\[128\] =  prpg_out_i\[405\] ^  lfsrout\[193\];
assign prpg_out_i\[129\] =  prpg_out_i\[451\] ^  lfsrout\[98\];
assign prpg_out_i\[130\] =  prpg_out_i\[225\] ^  lfsrout\[14\];
assign prpg_out_i\[131\] =  lfsrout\[46\] ^  lfsrout\[176\];
assign prpg_out_i\[132\] =  prpg_out_i\[158\] ^  lfsrout\[183\];
assign prpg_out_i\[133\] =  prpg_out_i\[474\] ^  lfsrout\[14\];
assign prpg_out_i\[134\] =  prpg_out_i\[270\] ^  lfsrout\[242\];
assign prpg_out_i\[135\] =  prpg_out_i\[396\] ^  lfsrout\[224\];
assign prpg_out_i\[136\] =  prpg_out_i\[431\] ^  lfsrout\[160\];
assign prpg_out_i\[137\] =  prpg_out_i\[92\] ^  lfsrout\[44\];
assign prpg_out_i\[138\] =  lfsrout\[60\] ^  lfsrout\[67\];
assign prpg_out_i\[139\] =  prpg_out_i\[464\] ^  lfsrout\[113\];
assign prpg_out_i\[140\] =  prpg_out_i\[203\] ^  lfsrout\[204\];
assign prpg_out_i\[141\] =  prpg_out_i\[88\] ^  lfsrout\[93\];
assign prpg_out_i\[142\] =  prpg_out_i\[354\] ^  lfsrout\[66\];
assign prpg_out_i\[143\] =  prpg_out_i\[384\] ^  lfsrout\[100\];
assign prpg_out_i\[144\] =  prpg_out_i\[459\] ^  lfsrout\[232\];
assign prpg_out_i\[145\] =  prpg_out_i\[376\] ^  lfsrout\[34\];
assign prpg_out_i\[146\] =  prpg_out_i\[335\] ^  lfsrout\[57\];
assign prpg_out_i\[147\] =  prpg_out_i\[60\] ^  lfsrout\[188\];
assign prpg_out_i\[148\] =  prpg_out_i\[284\] ^  lfsrout\[31\];
assign prpg_out_i\[149\] =  prpg_out_i\[288\] ^  lfsrout\[141\];
assign prpg_out_i\[150\] =  prpg_out_i\[195\] ^  lfsrout\[152\];
assign prpg_out_i\[151\] =  prpg_out_i\[488\] ^  lfsrout\[221\];
assign prpg_out_i\[152\] =  prpg_out_i\[206\] ^  lfsrout\[86\];
assign prpg_out_i\[153\] =  prpg_out_i\[176\] ^  lfsrout\[136\];
assign prpg_out_i\[154\] =  lfsrout\[69\] ^  lfsrout\[92\];
assign prpg_out_i\[155\] =  prpg_out_i\[127\] ^  lfsrout\[191\];
assign prpg_out_i\[156\] =  prpg_out_i\[385\] ^  lfsrout\[128\];
assign prpg_out_i\[157\] =  prpg_out_i\[251\] ^  lfsrout\[49\];
assign prpg_out_i\[158\] =  prpg_out_i\[300\] ^  lfsrout\[109\];
assign prpg_out_i\[159\] =  prpg_out_i\[469\] ^  lfsrout\[38\];
assign prpg_out_i\[160\] =  prpg_out_i\[372\] ^  lfsrout\[174\];
assign prpg_out_i\[161\] =  prpg_out_i\[413\] ^  lfsrout\[95\];
assign prpg_out_i\[162\] =  prpg_out_i\[302\] ^  lfsrout\[125\];
assign prpg_out_i\[163\] =  prpg_out_i\[226\] ^  lfsrout\[248\];
assign prpg_out_i\[164\] =  prpg_out_i\[371\] ^  lfsrout\[36\];
assign prpg_out_i\[165\] =  lfsrout\[59\] ^  lfsrout\[64\];
assign prpg_out_i\[166\] =  prpg_out_i\[350\] ^  lfsrout\[200\];
assign prpg_out_i\[167\] =  prpg_out_i\[205\] ^  lfsrout\[55\];
assign prpg_out_i\[168\] =  prpg_out_i\[181\] ^  lfsrout\[67\];
assign prpg_out_i\[169\] =  prpg_out_i\[364\] ^  lfsrout\[11\];
assign prpg_out_i\[170\] =  lfsrout\[23\] ^  lfsrout\[241\];
assign prpg_out_i\[171\] =  lfsrout\[27\] ^  lfsrout\[54\];
assign prpg_out_i\[172\] =  prpg_out_i\[276\] ^  lfsrout\[78\];
assign prpg_out_i\[173\] =  prpg_out_i\[172\] ^  lfsrout\[39\];
assign prpg_out_i\[174\] =  lfsrout\[71\] ^  lfsrout\[130\];
assign prpg_out_i\[175\] =  prpg_out_i\[315\] ^  lfsrout\[30\];
assign prpg_out_i\[176\] =  prpg_out_i\[357\] ^  lfsrout\[242\];
assign prpg_out_i\[177\] =  prpg_out_i\[278\] ^  lfsrout\[90\];
assign prpg_out_i\[178\] =  prpg_out_i\[289\] ^  lfsrout\[57\];
assign prpg_out_i\[179\] =  prpg_out_i\[432\] ^  lfsrout\[79\];
assign prpg_out_i\[180\] =  prpg_out_i\[440\] ^  lfsrout\[207\];
assign prpg_out_i\[181\] =  prpg_out_i\[308\] ^  lfsrout\[134\];
assign prpg_out_i\[182\] =  prpg_out_i\[501\] ^  lfsrout\[178\];
assign prpg_out_i\[183\] =  prpg_out_i\[285\] ^  lfsrout\[248\];
assign prpg_out_i\[184\] =  prpg_out_i\[348\] ^  lfsrout\[36\];
assign prpg_out_i\[185\] =  prpg_out_i\[494\] ^  lfsrout\[125\];
assign prpg_out_i\[186\] =  prpg_out_i\[126\] ^  lfsrout\[121\];
assign prpg_out_i\[187\] =  prpg_out_i\[62\] ^  lfsrout\[252\];
assign prpg_out_i\[188\] =  prpg_out_i\[271\] ^  lfsrout\[121\];
assign prpg_out_i\[189\] =  prpg_out_i\[148\] ^  lfsrout\[38\];
assign prpg_out_i\[190\] =  prpg_out_i\[45\] ^  lfsrout\[174\];
assign prpg_out_i\[191\] =  prpg_out_i\[243\] ^  lfsrout\[118\];
assign prpg_out_i\[192\] =  lfsrout\[94\] ^  lfsrout\[233\];
assign prpg_out_i\[193\] =  prpg_out_i\[175\] ^  lfsrout\[15\];
assign prpg_out_i\[194\] =  prpg_out_i\[147\] ^  lfsrout\[94\];
assign prpg_out_i\[195\] =  prpg_out_i\[272\] ^  lfsrout\[67\];
assign prpg_out_i\[196\] =  prpg_out_i\[130\] ^  lfsrout\[7\];
assign prpg_out_i\[197\] =  prpg_out_i\[386\] ^  lfsrout\[170\];
assign prpg_out_i\[198\] =  prpg_out_i\[442\] ^  lfsrout\[255\];
assign prpg_out_i\[199\] =  prpg_out_i\[500\] ^  lfsrout\[128\];
assign prpg_out_i\[200\] =  lfsrout\[40\] ^  lfsrout\[211\];
assign prpg_out_i\[201\] =  prpg_out_i\[2\] ^  lfsrout\[140\];
assign prpg_out_i\[202\] =  lfsrout\[98\] ^  lfsrout\[109\];
assign prpg_out_i\[203\] =  prpg_out_i\[93\] ^  lfsrout\[151\];
assign prpg_out_i\[204\] =  lfsrout\[30\] ^  lfsrout\[53\];
assign prpg_out_i\[205\] =  prpg_out_i\[138\] ^  lfsrout\[165\];
assign prpg_out_i\[206\] =  lfsrout\[205\] ^  lfsrout\[217\];
assign prpg_out_i\[207\] =  prpg_out_i\[295\] ^  lfsrout\[137\];
assign prpg_out_i\[208\] =  lfsrout\[16\] ^  lfsrout\[250\];
assign prpg_out_i\[209\] =  prpg_out_i\[419\] ^  lfsrout\[245\];
assign prpg_out_i\[210\] =  prpg_out_i\[424\] ^  lfsrout\[58\];
assign prpg_out_i\[211\] =  prpg_out_i\[199\] ^  lfsrout\[64\];
assign prpg_out_i\[212\] =  prpg_out_i\[310\] ^  lfsrout\[8\];
assign prpg_out_i\[213\] =  prpg_out_i\[98\] ^  lfsrout\[180\];
assign prpg_out_i\[214\] =  lfsrout\[114\] ^  lfsrout\[117\];
assign prpg_out_i\[215\] =  lfsrout\[24\] ^  lfsrout\[98\];
assign prpg_out_i\[216\] =  prpg_out_i\[85\] ^  lfsrout\[225\];
assign prpg_out_i\[217\] =  lfsrout\[132\] ^  lfsrout\[250\];
assign prpg_out_i\[218\] =  lfsrout\[4\] ^  lfsrout\[155\];
assign prpg_out_i\[219\] =  prpg_out_i\[333\] ^  lfsrout\[217\];
assign prpg_out_i\[220\] =  prpg_out_i\[131\] ^  lfsrout\[114\];
assign prpg_out_i\[221\] =  prpg_out_i\[283\] ^  lfsrout\[208\];
assign prpg_out_i\[222\] =  lfsrout\[171\] ^  lfsrout\[252\];
assign prpg_out_i\[223\] =  prpg_out_i\[264\] ^  lfsrout\[233\];
assign prpg_out_i\[224\] =  prpg_out_i\[121\] ^  lfsrout\[17\];
assign prpg_out_i\[225\] =  lfsrout\[154\] ^  lfsrout\[203\];
assign prpg_out_i\[226\] =  lfsrout\[196\] ^  lfsrout\[205\];
assign prpg_out_i\[227\] =  prpg_out_i\[265\] ^  lfsrout\[201\];
assign prpg_out_i\[228\] =  prpg_out_i\[234\] ^  lfsrout\[256\];
assign prpg_out_i\[229\] =  prpg_out_i\[252\] ^  lfsrout\[96\];
assign prpg_out_i\[230\] =  prpg_out_i\[306\] ^  lfsrout\[100\];
assign prpg_out_i\[231\] =  prpg_out_i\[301\] ^  lfsrout\[65\];
assign prpg_out_i\[232\] =  prpg_out_i\[185\] ^  lfsrout\[191\];
assign prpg_out_i\[233\] =  prpg_out_i\[468\] ^  lfsrout\[253\];
assign prpg_out_i\[234\] =  prpg_out_i\[23\] ^  lfsrout\[242\];
assign prpg_out_i\[235\] =  prpg_out_i\[192\] ^  lfsrout\[108\];
assign prpg_out_i\[236\] =  lfsrout\[140\] ^  lfsrout\[142\];
assign prpg_out_i\[237\] =  prpg_out_i\[506\] ^  lfsrout\[134\];
assign prpg_out_i\[238\] =  prpg_out_i\[103\] ^  lfsrout\[161\];
assign prpg_out_i\[239\] =  prpg_out_i\[395\] ^  lfsrout\[243\];
assign prpg_out_i\[240\] =  prpg_out_i\[477\] ^  lfsrout\[185\];
assign prpg_out_i\[241\] =  prpg_out_i\[36\] ^  lfsrout\[103\];
assign prpg_out_i\[242\] =  lfsrout\[6\] ^  lfsrout\[237\];
assign prpg_out_i\[243\] =  lfsrout\[64\] ^  lfsrout\[73\];
assign prpg_out_i\[244\] =  prpg_out_i\[321\] ^  lfsrout\[144\];
assign prpg_out_i\[245\] =  prpg_out_i\[153\] ^  lfsrout\[68\];
assign prpg_out_i\[246\] =  lfsrout\[171\] ^  lfsrout\[216\];
assign prpg_out_i\[247\] =  prpg_out_i\[228\] ^  lfsrout\[64\];
assign prpg_out_i\[248\] =  prpg_out_i\[430\] ^  lfsrout\[94\];
assign prpg_out_i\[249\] =  prpg_out_i\[7\] ^  lfsrout\[105\];
assign prpg_out_i\[250\] =  prpg_out_i\[362\] ^  lfsrout\[241\];
assign prpg_out_i\[251\] =  prpg_out_i\[202\] ^  lfsrout\[242\];
assign prpg_out_i\[252\] =  prpg_out_i\[314\] ^  lfsrout\[192\];
assign prpg_out_i\[253\] =  prpg_out_i\[18\] ^  lfsrout\[246\];
assign prpg_out_i\[254\] =  lfsrout\[85\] ^  lfsrout\[127\];
assign prpg_out_i\[255\] =  prpg_out_i\[505\] ^  lfsrout\[223\];
assign prpg_out_i\[256\] =  lfsrout\[30\] ^  lfsrout\[178\];
assign prpg_out_i\[257\] =  lfsrout\[242\] ^  lfsrout\[253\];
assign prpg_out_i\[258\] =  prpg_out_i\[144\] ^  lfsrout\[137\];
assign prpg_out_i\[259\] =  prpg_out_i\[307\] ^  lfsrout\[220\];
assign prpg_out_i\[260\] =  prpg_out_i\[292\] ^  lfsrout\[133\];
assign prpg_out_i\[261\] =  lfsrout\[43\] ^  lfsrout\[55\];
assign prpg_out_i\[262\] =  prpg_out_i\[141\] ^  lfsrout\[175\];
assign prpg_out_i\[263\] =  prpg_out_i\[212\] ^  lfsrout\[27\];
assign prpg_out_i\[264\] =  prpg_out_i\[242\] ^  lfsrout\[34\];
assign prpg_out_i\[265\] =  lfsrout\[124\] ^  lfsrout\[230\];
assign prpg_out_i\[266\] =  lfsrout\[17\] ^  lfsrout\[96\];
assign prpg_out_i\[267\] =  prpg_out_i\[86\] ^  lfsrout\[248\];
assign prpg_out_i\[268\] =  prpg_out_i\[280\] ^  lfsrout\[75\];
assign prpg_out_i\[269\] =  lfsrout\[6\] ^  lfsrout\[95\];
assign prpg_out_i\[270\] =  prpg_out_i\[71\] ^  lfsrout\[218\];
assign prpg_out_i\[271\] =  lfsrout\[177\] ^  lfsrout\[244\];
assign prpg_out_i\[272\] =  prpg_out_i\[441\] ^  lfsrout\[134\];
assign prpg_out_i\[273\] =  prpg_out_i\[19\] ^  lfsrout\[124\];
assign prpg_out_i\[274\] =  prpg_out_i\[95\] ^  lfsrout\[190\];
assign prpg_out_i\[275\] =  lfsrout\[168\] ^  lfsrout\[188\];
assign prpg_out_i\[276\] =  prpg_out_i\[166\] ^  lfsrout\[100\];
assign prpg_out_i\[277\] =  prpg_out_i\[232\] ^  lfsrout\[18\];
assign prpg_out_i\[278\] =  lfsrout\[3\] ^  lfsrout\[28\];
assign prpg_out_i\[279\] =  prpg_out_i\[450\] ^  lfsrout\[128\];
assign prpg_out_i\[280\] =  prpg_out_i\[227\] ^  lfsrout\[229\];
assign prpg_out_i\[281\] =  prpg_out_i\[304\] ^  lfsrout\[256\];
assign prpg_out_i\[282\] =  prpg_out_i\[133\] ^  lfsrout\[95\];
assign prpg_out_i\[283\] =  lfsrout\[59\] ^  lfsrout\[153\];
assign prpg_out_i\[284\] =  prpg_out_i\[492\] ^  lfsrout\[62\];
assign prpg_out_i\[285\] =  prpg_out_i\[27\] ^  lfsrout\[32\];
assign prpg_out_i\[286\] =  prpg_out_i\[240\] ^  lfsrout\[221\];
assign prpg_out_i\[287\] =  prpg_out_i\[263\] ^  lfsrout\[29\];
assign prpg_out_i\[288\] =  prpg_out_i\[16\] ^  lfsrout\[121\];
assign prpg_out_i\[289\] =  prpg_out_i\[322\] ^  lfsrout\[63\];
assign prpg_out_i\[290\] =  prpg_out_i\[258\] ^  lfsrout\[197\];
assign prpg_out_i\[291\] =  prpg_out_i\[165\] ^  lfsrout\[251\];
assign prpg_out_i\[292\] =  prpg_out_i\[222\] ^  lfsrout\[9\];
assign prpg_out_i\[293\] =  prpg_out_i\[359\] ^  lfsrout\[177\];
assign prpg_out_i\[294\] =  prpg_out_i\[319\] ^  lfsrout\[37\];
assign prpg_out_i\[295\] =  prpg_out_i\[340\] ^  lfsrout\[251\];
assign prpg_out_i\[296\] =  lfsrout\[149\] ^  lfsrout\[250\];
assign prpg_out_i\[297\] =  prpg_out_i\[112\] ^  lfsrout\[220\];
assign prpg_out_i\[298\] =  prpg_out_i\[193\] ^  lfsrout\[239\];
assign prpg_out_i\[299\] =  prpg_out_i\[466\] ^  lfsrout\[117\];
assign prpg_out_i\[300\] =  prpg_out_i\[504\] ^  lfsrout\[218\];
assign prpg_out_i\[301\] =  prpg_out_i\[391\] ^  lfsrout\[130\];
assign prpg_out_i\[302\] =  lfsrout\[51\] ^  lfsrout\[62\];
assign prpg_out_i\[303\] =  lfsrout\[4\] ^  lfsrout\[135\];
assign prpg_out_i\[304\] =  prpg_out_i\[159\] ^  lfsrout\[255\];
assign prpg_out_i\[305\] =  prpg_out_i\[218\] ^  lfsrout\[63\];
assign prpg_out_i\[306\] =  prpg_out_i\[365\] ^  lfsrout\[200\];
assign prpg_out_i\[307\] =  prpg_out_i\[248\] ^  lfsrout\[47\];
assign prpg_out_i\[308\] =  prpg_out_i\[163\] ^  lfsrout\[124\];
assign prpg_out_i\[309\] =  prpg_out_i\[5\] ^  lfsrout\[199\];
assign prpg_out_i\[310\] =  lfsrout\[81\] ^  lfsrout\[227\];
assign prpg_out_i\[311\] =  prpg_out_i\[191\] ^  lfsrout\[59\];
assign prpg_out_i\[312\] =  prpg_out_i\[162\] ^  lfsrout\[191\];
assign prpg_out_i\[313\] =  prpg_out_i\[408\] ^  lfsrout\[255\];
assign prpg_out_i\[314\] =  prpg_out_i\[72\] ^  lfsrout\[127\];
assign prpg_out_i\[315\] =  prpg_out_i\[171\] ^  lfsrout\[104\];
assign prpg_out_i\[316\] =  prpg_out_i\[380\] ^  lfsrout\[112\];
assign prpg_out_i\[317\] =  prpg_out_i\[422\] ^  lfsrout\[205\];
assign prpg_out_i\[318\] =  prpg_out_i\[182\] ^  lfsrout\[228\];
assign prpg_out_i\[319\] =  lfsrout\[17\] ^  lfsrout\[169\];
assign prpg_out_i\[320\] =  lfsrout\[216\] ^  lfsrout\[230\];
assign prpg_out_i\[321\] =  lfsrout\[32\] ^  lfsrout\[236\];
assign prpg_out_i\[322\] =  prpg_out_i\[499\] ^  lfsrout\[11\];
assign prpg_out_i\[323\] =  prpg_out_i\[253\] ^  lfsrout\[83\];
assign prpg_out_i\[324\] =  prpg_out_i\[407\] ^  lfsrout\[6\];
assign prpg_out_i\[325\] =  lfsrout\[145\] ^  lfsrout\[154\];
assign prpg_out_i\[326\] =  lfsrout\[49\] ^  lfsrout\[245\];
assign prpg_out_i\[327\] =  prpg_out_i\[309\] ^  lfsrout\[228\];
assign prpg_out_i\[328\] =  prpg_out_i\[160\] ^  lfsrout\[87\];
assign prpg_out_i\[329\] =  prpg_out_i\[465\] ^  lfsrout\[233\];
assign prpg_out_i\[330\] =  prpg_out_i\[217\] ^  lfsrout\[69\];
assign prpg_out_i\[331\] =  prpg_out_i\[257\] ^  lfsrout\[24\];
assign prpg_out_i\[332\] =  prpg_out_i\[6\] ^  lfsrout\[1\];
assign prpg_out_i\[333\] =  prpg_out_i\[342\] ^  lfsrout\[235\];
assign prpg_out_i\[334\] =  prpg_out_i\[179\] ^  lfsrout\[37\];
assign prpg_out_i\[335\] =  prpg_out_i\[318\] ^  lfsrout\[114\];
assign prpg_out_i\[336\] =  prpg_out_i\[427\] ^  lfsrout\[115\];
assign prpg_out_i\[337\] =  prpg_out_i\[79\] ^  lfsrout\[164\];
assign prpg_out_i\[338\] =  prpg_out_i\[246\] ^  lfsrout\[144\];
assign prpg_out_i\[339\] =  prpg_out_i\[495\] ^  lfsrout\[110\];
assign prpg_out_i\[340\] =  prpg_out_i\[346\] ^  lfsrout\[245\];
assign prpg_out_i\[341\] =  prpg_out_i\[34\] ^  lfsrout\[125\];
assign prpg_out_i\[342\] =  prpg_out_i\[177\] ^  lfsrout\[213\];
assign prpg_out_i\[343\] =  prpg_out_i\[9\] ^  lfsrout\[65\];
assign prpg_out_i\[344\] =  prpg_out_i\[91\] ^  lfsrout\[256\];
assign prpg_out_i\[345\] =  prpg_out_i\[250\] ^  lfsrout\[249\];
assign prpg_out_i\[346\] =  prpg_out_i\[25\] ^  lfsrout\[119\];
assign prpg_out_i\[347\] =  prpg_out_i\[183\] ^  lfsrout\[124\];
assign prpg_out_i\[348\] =  prpg_out_i\[370\] ^  lfsrout\[80\];
assign prpg_out_i\[349\] =  prpg_out_i\[125\] ^  lfsrout\[81\];
assign prpg_out_i\[350\] =  lfsrout\[109\] ^  lfsrout\[238\];
assign prpg_out_i\[351\] =  prpg_out_i\[339\] ^  lfsrout\[99\];
assign prpg_out_i\[352\] =  prpg_out_i\[489\] ^  lfsrout\[155\];
assign prpg_out_i\[353\] =  lfsrout\[29\] ^  lfsrout\[106\];
assign prpg_out_i\[354\] =  prpg_out_i\[196\] ^  lfsrout\[132\];
assign prpg_out_i\[355\] =  lfsrout\[23\] ^  lfsrout\[232\];
assign prpg_out_i\[356\] =  prpg_out_i\[110\] ^  lfsrout\[115\];
assign prpg_out_i\[357\] =  lfsrout\[15\] ^  lfsrout\[43\];
assign prpg_out_i\[358\] =  prpg_out_i\[174\] ^  lfsrout\[209\];
assign prpg_out_i\[359\] =  prpg_out_i\[151\] ^  lfsrout\[239\];
assign prpg_out_i\[360\] =  lfsrout\[241\] ^  lfsrout\[249\];
assign prpg_out_i\[361\] =  prpg_out_i\[331\] ^  lfsrout\[114\];
assign prpg_out_i\[362\] =  prpg_out_i\[447\] ^  lfsrout\[120\];
assign prpg_out_i\[363\] =  lfsrout\[138\] ^  lfsrout\[141\];
assign prpg_out_i\[364\] =  prpg_out_i\[137\] ^  lfsrout\[22\];
assign prpg_out_i\[365\] =  prpg_out_i\[387\] ^  lfsrout\[143\];
assign prpg_out_i\[366\] =  prpg_out_i\[449\] ^  lfsrout\[125\];
assign prpg_out_i\[367\] =  lfsrout\[85\] ^  lfsrout\[108\];
assign prpg_out_i\[368\] =  lfsrout\[17\] ^  lfsrout\[102\];
assign prpg_out_i\[369\] =  prpg_out_i\[416\] ^  lfsrout\[30\];
assign prpg_out_i\[370\] =  prpg_out_i\[453\] ^  lfsrout\[237\];
assign prpg_out_i\[371\] =  prpg_out_i\[420\] ^  lfsrout\[72\];
assign prpg_out_i\[372\] =  prpg_out_i\[254\] ^  lfsrout\[91\];
assign prpg_out_i\[373\] =  prpg_out_i\[123\] ^  lfsrout\[223\];
assign prpg_out_i\[374\] =  prpg_out_i\[360\] ^  lfsrout\[14\];
assign prpg_out_i\[375\] =  prpg_out_i\[188\] ^  lfsrout\[99\];
assign prpg_out_i\[376\] =  prpg_out_i\[17\] ^  lfsrout\[146\];
assign prpg_out_i\[377\] =  prpg_out_i\[425\] ^  lfsrout\[147\];
assign prpg_out_i\[378\] =  prpg_out_i\[83\] ^  lfsrout\[36\];
assign prpg_out_i\[379\] =  prpg_out_i\[82\] ^  lfsrout\[205\];
assign prpg_out_i\[380\] =  prpg_out_i\[1\] ^  lfsrout\[224\];
assign prpg_out_i\[381\] =  prpg_out_i\[32\] ^  lfsrout\[120\];
assign prpg_out_i\[382\] =  prpg_out_i\[224\] ^  lfsrout\[242\];
assign prpg_out_i\[383\] =  lfsrout\[18\] ^  lfsrout\[129\];
assign prpg_out_i\[384\] =  prpg_out_i\[498\] ^  lfsrout\[200\];
assign prpg_out_i\[385\] =  prpg_out_i\[29\] ^  lfsrout\[88\];
assign prpg_out_i\[386\] =  prpg_out_i\[48\] ^  lfsrout\[83\];
assign prpg_out_i\[387\] =  prpg_out_i\[368\] ^  lfsrout\[29\];
assign prpg_out_i\[388\] =  lfsrout\[143\] ^  lfsrout\[169\];
assign prpg_out_i\[389\] =  prpg_out_i\[404\] ^  lfsrout\[81\];
assign prpg_out_i\[390\] =  prpg_out_i\[496\] ^  lfsrout\[189\];
assign prpg_out_i\[391\] =  lfsrout\[204\] ^  lfsrout\[236\];
assign prpg_out_i\[392\] =  prpg_out_i\[467\] ^  lfsrout\[16\];
assign prpg_out_i\[393\] =  prpg_out_i\[326\] ^  lfsrout\[8\];
assign prpg_out_i\[394\] =  prpg_out_i\[410\] ^  lfsrout\[148\];
assign prpg_out_i\[395\] =  prpg_out_i\[291\] ^  lfsrout\[115\];
assign prpg_out_i\[396\] =  prpg_out_i\[37\] ^  lfsrout\[80\];
assign prpg_out_i\[397\] =  lfsrout\[232\] ^  lfsrout\[246\];
assign prpg_out_i\[398\] =  prpg_out_i\[275\] ^  lfsrout\[143\];
assign prpg_out_i\[399\] =  prpg_out_i\[69\] ^  lfsrout\[253\];
assign prpg_out_i\[400\] =  prpg_out_i\[187\] ^  lfsrout\[126\];
assign prpg_out_i\[401\] =  prpg_out_i\[507\] ^  lfsrout\[57\];
assign prpg_out_i\[402\] =  prpg_out_i\[152\] ^  lfsrout\[210\];
assign prpg_out_i\[403\] =  lfsrout\[12\] ^  lfsrout\[239\];
assign prpg_out_i\[404\] =  prpg_out_i\[444\] ^  lfsrout\[162\];
assign prpg_out_i\[405\] =  lfsrout\[6\] ^  lfsrout\[58\];
assign prpg_out_i\[406\] =  prpg_out_i\[262\] ^  lfsrout\[207\];
assign prpg_out_i\[407\] =  prpg_out_i\[90\] ^  lfsrout\[12\];
assign prpg_out_i\[408\] =  lfsrout\[41\] ^  lfsrout\[55\];
assign prpg_out_i\[409\] =  prpg_out_i\[215\] ^  lfsrout\[170\];
assign prpg_out_i\[410\] =  lfsrout\[143\] ^  lfsrout\[209\];
assign prpg_out_i\[411\] =  prpg_out_i\[349\] ^  lfsrout\[13\];
assign prpg_out_i\[412\] =  prpg_out_i\[378\] ^  lfsrout\[18\];
assign prpg_out_i\[413\] =  prpg_out_i\[63\] ^  lfsrout\[49\];
assign prpg_out_i\[414\] =  prpg_out_i\[458\] ^  lfsrout\[60\];
assign prpg_out_i\[415\] =  lfsrout\[133\] ^  lfsrout\[198\];
assign prpg_out_i\[416\] =  prpg_out_i\[244\] ^  lfsrout\[72\];
assign prpg_out_i\[417\] =  prpg_out_i\[24\] ^  lfsrout\[96\];
assign prpg_out_i\[418\] =  prpg_out_i\[452\] ^  lfsrout\[3\];
assign prpg_out_i\[419\] =  prpg_out_i\[49\] ^  lfsrout\[233\];
assign prpg_out_i\[420\] =  lfsrout\[198\] ^  lfsrout\[215\];
assign prpg_out_i\[421\] =  prpg_out_i\[231\] ^  lfsrout\[216\];
assign prpg_out_i\[422\] =  lfsrout\[152\] ^  lfsrout\[210\];
assign prpg_out_i\[423\] =  prpg_out_i\[274\] ^  lfsrout\[76\];
assign prpg_out_i\[424\] =  prpg_out_i\[481\] ^  lfsrout\[116\];
assign prpg_out_i\[425\] =  prpg_out_i\[457\] ^  lfsrout\[37\];
assign prpg_out_i\[426\] =  prpg_out_i\[268\] ^  lfsrout\[166\];
assign prpg_out_i\[427\] =  prpg_out_i\[361\] ^  lfsrout\[230\];
assign prpg_out_i\[428\] =  prpg_out_i\[113\] ^  lfsrout\[50\];
assign prpg_out_i\[429\] =  prpg_out_i\[369\] ^  lfsrout\[180\];
assign prpg_out_i\[430\] =  prpg_out_i\[116\] ^  lfsrout\[213\];
assign prpg_out_i\[431\] =  prpg_out_i\[260\] ^  lfsrout\[195\];
assign prpg_out_i\[432\] =  lfsrout\[48\] ^  lfsrout\[140\];
assign prpg_out_i\[433\] =  prpg_out_i\[57\] ^  lfsrout\[245\];
assign prpg_out_i\[434\] =  prpg_out_i\[337\] ^  lfsrout\[82\];
assign prpg_out_i\[435\] =  prpg_out_i\[377\] ^  lfsrout\[241\];
assign prpg_out_i\[436\] =  prpg_out_i\[102\] ^  lfsrout\[193\];
assign prpg_out_i\[437\] =  prpg_out_i\[75\] ^  lfsrout\[61\];
assign prpg_out_i\[438\] =  prpg_out_i\[156\] ^  lfsrout\[64\];
assign prpg_out_i\[439\] =  prpg_out_i\[403\] ^  lfsrout\[127\];
assign prpg_out_i\[440\] =  prpg_out_i\[122\] ^  lfsrout\[157\];
assign prpg_out_i\[441\] =  prpg_out_i\[296\] ^  lfsrout\[11\];
assign prpg_out_i\[442\] =  prpg_out_i\[311\] ^  lfsrout\[253\];
assign prpg_out_i\[443\] =  prpg_out_i\[282\] ^  lfsrout\[176\];
assign prpg_out_i\[444\] =  prpg_out_i\[388\] ^  lfsrout\[67\];
assign prpg_out_i\[445\] =  prpg_out_i\[132\] ^  lfsrout\[220\];
assign prpg_out_i\[446\] =  prpg_out_i\[273\] ^  lfsrout\[144\];
assign prpg_out_i\[447\] =  prpg_out_i\[397\] ^  lfsrout\[240\];
assign prpg_out_i\[448\] =  prpg_out_i\[247\] ^  lfsrout\[32\];
assign prpg_out_i\[449\] =  prpg_out_i\[394\] ^  lfsrout\[74\];
assign prpg_out_i\[450\] =  prpg_out_i\[402\] ^  lfsrout\[105\];
assign prpg_out_i\[451\] =  prpg_out_i\[417\] ^  lfsrout\[48\];
assign prpg_out_i\[452\] =  prpg_out_i\[455\] ^  lfsrout\[6\];
assign prpg_out_i\[453\] =  prpg_out_i\[28\] ^  lfsrout\[223\];
assign prpg_out_i\[454\] =  prpg_out_i\[401\] ^  lfsrout\[157\];
assign prpg_out_i\[455\] =  lfsrout\[125\] ^  lfsrout\[151\];
assign prpg_out_i\[456\] =  prpg_out_i\[233\] ^  lfsrout\[255\];
assign prpg_out_i\[457\] =  prpg_out_i\[325\] ^  lfsrout\[74\];
assign prpg_out_i\[458\] =  prpg_out_i\[313\] ^  lfsrout\[177\];
assign prpg_out_i\[459\] =  prpg_out_i\[115\] ^  lfsrout\[241\];
assign prpg_out_i\[460\] =  lfsrout\[7\] ^  lfsrout\[46\];
assign prpg_out_i\[461\] =  prpg_out_i\[106\] ^  lfsrout\[229\];
assign prpg_out_i\[462\] =  prpg_out_i\[124\] ^  lfsrout\[36\];
assign prpg_out_i\[463\] =  prpg_out_i\[421\] ^  lfsrout\[215\];
assign prpg_out_i\[464\] =  prpg_out_i\[433\] ^  lfsrout\[226\];
assign prpg_out_i\[465\] =  prpg_out_i\[267\] ^  lfsrout\[164\];
assign prpg_out_i\[466\] =  prpg_out_i\[56\] ^  lfsrout\[231\];
assign prpg_out_i\[467\] =  prpg_out_i\[211\] ^  lfsrout\[32\];
assign prpg_out_i\[468\] =  lfsrout\[196\] ^  lfsrout\[248\];
assign prpg_out_i\[469\] =  prpg_out_i\[491\] ^  lfsrout\[162\];
assign prpg_out_i\[470\] =  prpg_out_i\[114\] ^  lfsrout\[250\];
assign prpg_out_i\[471\] =  prpg_out_i\[154\] ^  lfsrout\[15\];
assign prpg_out_i\[472\] =  prpg_out_i\[484\] ^  lfsrout\[113\];
assign prpg_out_i\[473\] =  prpg_out_i\[502\] ^  lfsrout\[151\];
assign prpg_out_i\[474\] =  lfsrout\[165\] ^  lfsrout\[204\];
assign prpg_out_i\[475\] =  prpg_out_i\[70\] ^  lfsrout\[240\];
assign prpg_out_i\[476\] =  prpg_out_i\[437\] ^  lfsrout\[159\];
assign prpg_out_i\[477\] =  prpg_out_i\[478\] ^  lfsrout\[251\];
assign prpg_out_i\[478\] =  prpg_out_i\[320\] ^  lfsrout\[245\];
assign prpg_out_i\[479\] =  prpg_out_i\[157\] ^  lfsrout\[197\];
assign prpg_out_i\[480\] =  prpg_out_i\[99\] ^  lfsrout\[22\];
assign prpg_out_i\[481\] =  prpg_out_i\[483\] ^  lfsrout\[232\];
assign prpg_out_i\[482\] =  prpg_out_i\[194\] ^  lfsrout\[47\];
assign prpg_out_i\[483\] =  prpg_out_i\[383\] ^  lfsrout\[207\];
assign prpg_out_i\[484\] =  prpg_out_i\[35\] ^  lfsrout\[146\];
assign prpg_out_i\[485\] =  prpg_out_i\[167\] ^  lfsrout\[156\];
assign prpg_out_i\[486\] =  prpg_out_i\[510\] ^  lfsrout\[251\];
assign prpg_out_i\[487\] =  prpg_out_i\[204\] ^  lfsrout\[196\];
assign prpg_out_i\[488\] =  prpg_out_i\[4\] ^  lfsrout\[78\];
assign prpg_out_i\[489\] =  prpg_out_i\[490\] ^  lfsrout\[63\];
assign prpg_out_i\[490\] =  lfsrout\[13\] ^  lfsrout\[184\];
assign prpg_out_i\[491\] =  lfsrout\[121\] ^  lfsrout\[250\];
assign prpg_out_i\[492\] =  lfsrout\[12\] ^  lfsrout\[251\];
assign prpg_out_i\[493\] =  prpg_out_i\[20\] ^  lfsrout\[163\];
assign prpg_out_i\[494\] =  lfsrout\[38\] ^  lfsrout\[256\];
assign prpg_out_i\[495\] =  prpg_out_i\[409\] ^  lfsrout\[85\];
assign prpg_out_i\[496\] =  prpg_out_i\[197\] ^  lfsrout\[121\];
assign prpg_out_i\[497\] =  prpg_out_i\[52\] ^  lfsrout\[91\];
assign prpg_out_i\[498\] =  prpg_out_i\[305\] ^  lfsrout\[160\];
assign prpg_out_i\[499\] =  prpg_out_i\[266\] ^  lfsrout\[0\];
assign prpg_out_i\[500\] =  lfsrout\[166\] ^  lfsrout\[254\];
assign prpg_out_i\[501\] =  lfsrout\[47\] ^  lfsrout\[97\];
assign prpg_out_i\[502\] =  prpg_out_i\[334\] ^  lfsrout\[44\];
assign prpg_out_i\[503\] =  prpg_out_i\[96\] ^  lfsrout\[87\];
assign prpg_out_i\[504\] =  lfsrout\[115\] ^  lfsrout\[172\];
assign prpg_out_i\[505\] =  prpg_out_i\[493\] ^  lfsrout\[189\];
assign prpg_out_i\[506\] =  prpg_out_i\[393\] ^  lfsrout\[136\];
assign prpg_out_i\[507\] =  prpg_out_i\[353\] ^  lfsrout\[62\];
assign prpg_out_i\[508\] =  prpg_out_i\[438\] ^  lfsrout\[230\];
assign prpg_out_i\[509\] =  prpg_out_i\[476\] ^  lfsrout\[208\];
assign prpg_out_i\[510\] =  prpg_out_i\[330\] ^  lfsrout\[163\];
assign prpg_out_i\[511\] =  prpg_out_i\[239\] ^  lfsrout\[250\];
endmodule" }

puts "
//------------------------------------------------------------------------------
// LFSR shadow block definition
//------------------------------------------------------------------------------"
puts "module DFT_shadow_[expr $prpg_length]_[expr $shadow_width](bist_ck,
bist_mode,shadow_si,lfsrin,shadow_chain_so,ctrl_shadow_se, ctrl_shadow_in);
input \[[expr $shadow_width-1]:0\] shadow_si;
input bist_ck, bist_mode, ctrl_shadow_in,ctrl_shadow_se;
output \[[expr $prpg_length-1]:0\] lfsrin;
output shadow_chain_so;
reg \[[expr $prpg_length-1]:0\] lfsrin_i;
wire \[[expr $shadow_width-1]:0\] new_shadow_si;"


set segment_size [expr ($prpg_length + $shadow_width-1) / $shadow_width]
set last_segment_size [expr $prpg_length - (($shadow_width-1) * $segment_size)];
for {set n 0} {$n<$shadow_width} {incr n} { 
    if {$n != 0} {
	puts "  assign new_shadow_si\[$n\] = (bist_mode)?shadow_si\[$n\]:lfsrin_i\[[expr $n*$segment_size-1]\];"
    } else {
	puts "  assign new_shadow_si\[$n\] = \(bist_mode|ctrl_shadow_se\)?shadow_si\[$n\]\:ctrl_shadow_in;"
    }
}

puts "  always @(posedge bist_ck)
  begin
    lfsrin_i\[[expr $prpg_length-1]:0\] <= \{lfsrin_i\[[expr $prpg_length-2]:[expr $prpg_length-$last_segment_size]\],new_shadow_si\[[expr $shadow_width -1]\],"
for {set n 0} {$n< $shadow_width-2} {incr n} { 
  set m ($shadow_width-2-$n)
  puts "        lfsrin_i\[[expr (($m+1)*$segment_size)-2]:[expr $m*$segment_size]\],new_shadow_si\[[expr $m]\],"
}
puts "        lfsrin_i\[[expr $segment_size-2]:0\],new_shadow_si\[0]\};
  end
"
puts "
  assign shadow_chain_so = lfsrin_i\[[expr $prpg_length-1]\];
  assign lfsrin\[[expr $prpg_length-1]:0\] = lfsrin_i\[[expr $prpg_length-1]:0\];
       
endmodule"

puts "
//------------------------------------------------------------------------------
// LFSR block definition
//------------------------------------------------------------------------------"
set taps_257 [list 256 255 254 253 251 250 249 \
		  248 244 243 240 239 237 236 235 234 233 229 \
		  228 227 226 225 220 218 217 212 211 208 206 \
		  204 202 198 196 193 191 190 189 188 187 181 \
		  179 177 176 175 173 172 167 166 161 155 152 \
		  151 150 149 148 144 142 141 140 138 135 131 \
		  130 129 127 126 120 118 116 112 111 109 108 \
		  107 105 104 101 99  98  96  95  90  89  87 86 \
		  84 83 81 80 78 76 75 74 69 66 65 62 60 \
		  59 54 52 48 47 44 42 40 39 35 34 33 32 \
		  29 28 24 22 21 19 18 14 13 8 6 5 4 1 ]

set taps_479 [list 476 475 462 461 453 442 434 432 431 428 427 421 418 417 409 \
		  408 405 404 403 399 393 389 374 373 367 356 347 346 336 335 334 331 328 \
		  327 326 325 324 323 322 317 316 309 301 300 298 297 287 284 276 272 271 \
		  263 260 259 256 255 253 248 247 246 241 240 224 212 209 208 203 202 183 \
		  182 164 163 152 149 142 140 136 135 134 133 132 117 115 70 68 67 60 57 \
		  53 22 17 10 9 ]

if { $prpg_length == 479 } {
    set taps $taps_479
}
if { $prpg_length == 257 } {
    set taps $taps_257
}

puts "module DFT_lfsr_$prpg_length (bist_ck, prpg_scan, prpg_si, shadow_transfer, lfsrin,
        lfsrout, prpg_so);

input bist_ck, prpg_scan, prpg_si, shadow_transfer;
input \[[expr $prpg_length - 1]:0\] lfsrin;
output prpg_so;
output \[[expr $prpg_length - 1]:0\] lfsrout;
wire muxout,scanb,feedb;"
puts "wire \[[expr $prpg_length - 1]:0\] next_state;
wire \[[expr $prpg_length - 1]:0\] lfsr_data;
reg \[[expr $prpg_length - 1]:0\] lfsrout;"

puts "wire \[[expr [llength $taps] -1]:0\] xor_data;"
set m 0
foreach n $taps { 
    puts "  assign xor_data\[$m\] = lfsrout\[[expr $prpg_length - ($n+1) ]\] ^ feedb;"
    incr m
}

puts "  assign scanb = !prpg_scan;
  assign feedb = lfsrout\[[expr $prpg_length - 1]\] & scanb;
  assign prpg_so = lfsrout\[[expr $prpg_length - 1]\];"


puts "  always @(posedge bist_ck)
    lfsrout\[[expr $prpg_length - 1]:0\] <= (shadow_transfer)?lfsrin\[[expr $prpg_length - 1]:0\]:lfsr_data\[[expr $prpg_length - 1]:0\];

  assign lfsr_data\[[expr $prpg_length - 1]:0\]= next_state\[[expr $prpg_length - 1]:0\];"
set tab_length  [ llength $taps ]
set previous_index [expr $prpg_length - [ lindex $taps [expr $tab_length-1]]]

if { ( $prpg_length - 2) > $previous_index } {
    puts "  assign next_state = \{ lfsrout\[[expr $prpg_length -2]:[expr $previous_index ]\],xor_data\[[expr $tab_length-1]\],"
} else {
    if { [expr $prpg_length -2 ] == $previous_index } {
	puts "  assign next_state = \{ lfsrout\[[expr $previous_index ]\],xor_data\[[expr $tab_length-1]\],"
    } else {
	puts "  assign next_state = \{ xor_data\[[expr $tab_length-1]\],"
    }
}


set m 0
for { set p 2 } { $p <= $tab_length } { incr p } {
    set m [expr ($tab_length -$p)  ]
    set n [lindex $taps $m ]
    if { $previous_index!=(($prpg_length - $n) +1) } {
	if { ($previous_index-2) == ($prpg_length - $n) } {
	    puts "                        lfsrout\[[expr $previous_index-2]\],xor_data\[[expr $m]\],"
	} else {
	    puts "                        lfsrout\[[expr $previous_index-2]:[expr $prpg_length - $n ]\],xor_data\[[expr $m]\],"
	}
    } else {
	puts "                        xor_data\[[expr $m]\],"
    }
    set previous_index [expr $prpg_length - $n ]        
}
if { $previous_index > 2 } {
    puts "                       lfsrout\[[expr $previous_index-2]:0], muxout\};" 
} else {
    if { $previous_index == 2 } {
	puts "                        lfsrout\[0\], muxout\};" 
    } else {
	puts "                        muxout\};" 
    }
}
puts "  assign muxout = (~prpg_scan)?feedb:prpg_si;

endmodule"

puts "
//------------------------------------------------------------------------------
// PRPG block definiton
//------------------------------------------------------------------------------"
puts "module DFT_prpg_[expr $bist_type]_[expr $prpg_length]_[expr $chain_count]_[expr $shadow_width](bist_ck, 
 bist_mode, bist_bypass, prpg_scan, prpg_si, shadow_transfer, 
        shadow_scan, shadow_si, prpg_out, prpg_so, shadow_chain_so
 );

 input bist_ck, bist_mode, prpg_scan, prpg_si, shadow_transfer, shadow_scan;
 input bist_bypass;
 input \[[expr $shadow_width-1]:0\] shadow_si;
 output prpg_so, shadow_chain_so;
 output \[[expr $chain_count-1]:0\] prpg_out;
 wire clken, clk;
 wire \[[expr $prpg_length-1]:0\] lfsrout;
 wire \[[expr $prpg_length-1]:0\] lfsrin;

 assign clk = bist_ck;

   DFT_lfsr_$prpg_length
     U_lfsr_i (.bist_ck(clk), .prpg_scan(prpg_scan), .prpg_si(prpg_si),
           .shadow_transfer(shadow_transfer), .lfsrin(lfsrin), .lfsrout(lfsrout),
           .prpg_so(prpg_so));
   DFT_shadow_[expr $prpg_length]_[expr $shadow_width]
      U_shadow_i (.bist_ck(clk), .bist_mode(shadow_scan), .shadow_si(shadow_si), .shadow_chain_so(shadow_chain_so),
           .lfsrin(lfsrin), .ctrl_shadow_se(1'b1), .ctrl_shadow_in(1'b0));
   DFT_shifter_[expr $chain_count]_[expr $prpg_length]_512 
     U_shifter_i (.lfsrout(lfsrout), .prpg_out(prpg_out));
 endmodule"



puts "
//------------------------------------------------------------------------------
// Signature analysis block definition
//------------------------------------------------------------------------------"
puts "module DFT_sign_[expr $chain_count]_[expr $gen_bist_fail] (misr_reset, 
bist_ck, bist_mode, bist_bypass,
diag_mode, misr_si, misr_scan,
misr_scb,misr_in,diag_si,bist_fail,misr_so);

input \[3:0] misr_scb;
input \[[expr $chain_count-1]:0\] misr_in;
input  misr_reset, bist_ck, bist_mode, bist_bypass,diag_mode, misr_si, misr_scan;
input \[15:0] diag_si;
output \[15:0] misr_so;
output bist_fail; 
wire clken, clk, diag_si_zero;
wire \[15:0]misr_so_m;
wire \[15:0] misr_so_c;
wire \[127:0] cpct_out;

  assign clk = bist_ck;
  assign diag_si_zero = misr_si & ~diag_mode;
  assign misr_so = misr_so_m;

  DFT_misr_$gen_bist_fail U_misr_i(.misr_reset(misr_reset), .diag_mode(diag_mode),
      .bist_ck(clk), . misr_si(diag_si_zero), .misr_scan(misr_scan),
      .misr_scb(misr_scb), .cpct_out(cpct_out), 
      .diag_si(diag_si), .bist_fail(bist_fail), 
      .misr_so(misr_so_m));

  DFT_compact_$chain_count U_compactor_i(.misr_scb(misr_scb), 
      .misr_in(misr_in), .cpct_out(cpct_out));

 endmodule"

puts "
//------------------------------------------------------------------------------
// Compactor block definition
//------------------------------------------------------------------------------"
puts "module DFT_compact_$chain_count (misr_scb, misr_in, cpct_out);
input \[3:0\] misr_scb;
input \[[expr $chain_count-1]:0\] misr_in;
output \[127:0\] cpct_out;
wire misr;
wire \[511:0\] gin;
// length of misr_in_i is 513 to allow use of concat operation.
wire \[512:0\] misr_in_i;
wire \[127:0\] xin;
wire \[127:0\] yin;
wire \[127:0\] zin;

  assign misr = &misr_scb\[3:0\];
  assign misr_in_i = {{[ expr 513-$chain_count]{1'b0}}, misr_in};
  assign gin\[511:0\] = misr_in_i\[511:0\] & {128{misr_scb\[3:0\]}};
  assign yin\[127:0\] = {128{misr}} & xin\[127:0\];
  assign cpct_out\[127:0\] = zin\[127:0\] ^ yin\[127:0\];


  assign zin\[7:0\]  = \{ ^gin\[31:28\],  ^gin\[27:24\],  ^gin\[23:20\],  ^gin\[19:16\],  ^gin\[15:12\],  ^gin\[11:8\],   ^gin\[7:4\],    ^gin\[3:0\]\};
  assign zin\[15:8\] = \{ ^gin\[63:60\],  ^gin\[59:56\],  ^gin\[55:52\],  ^gin\[51:48\],  ^gin\[47:44\],  ^gin\[43:40\],  ^gin\[39:36\],  ^gin\[35:32\]\};
  assign zin\[23:16\]= \{ ^gin\[95:92\],  ^gin\[91:88\],  ^gin\[87:84\],  ^gin\[83:80\],  ^gin\[79:76\],  ^gin\[75:72\],  ^gin\[71:68\],  ^gin\[67:64\]\};
  assign zin\[31:24\]= \{ ^gin\[127:124\],^gin\[123:120\],^gin\[119:116\],^gin\[115:112\],^gin\[111:108\],^gin\[107:104\],^gin\[103:100\],^gin\[99:96\]\};
  assign zin\[39:32\]= \{ ^gin\[159:156\],^gin\[155:152\],^gin\[151:148\],^gin\[147:144\],^gin\[143:140\],^gin\[139:136\],^gin\[135:132\],^gin\[131:128\]\};
  assign zin\[47:40\]= \{ ^gin\[191:188\],^gin\[187:184\],^gin\[183:180\],^gin\[179:176\],^gin\[175:172\],^gin\[171:168\],^gin\[167:164\],^gin\[163:160\]\};
  assign zin\[55:48\]= \{ ^gin\[223:220\],^gin\[219:216\],^gin\[215:212\],^gin\[211:208\],^gin\[207:204\],^gin\[203:200\],^gin\[199:196\],^gin\[195:192\]\};
  assign zin\[63:56\]= \{ ^gin\[255:252\],^gin\[251:248\],^gin\[247:244\],^gin\[243:240\],^gin\[239:236\],^gin\[235:232\],^gin\[231:228\],^gin\[227:224\]\};
  assign zin\[71:64\]= \{ ^gin\[287:284\],^gin\[283:280\],^gin\[279:276\],^gin\[275:272\],^gin\[271:268\],^gin\[267:264\],^gin\[263:260\],^gin\[259:256\]\};
  assign zin\[79:72\]= \{ ^gin\[319:316\],^gin\[315:312\],^gin\[311:308\],^gin\[307:304\],^gin\[303:300\],^gin\[299:296\],^gin\[295:292\],^gin\[291:288\]\};
  assign zin\[87:80\]= \{ ^gin\[351:348\],^gin\[347:344\],^gin\[343:340\],^gin\[339:336\],^gin\[335:332\],^gin\[331:328\],^gin\[327:324\],^gin\[323:320\]\};
  assign zin\[95:88\]= \{ ^gin\[383:380\],^gin\[379:376\],^gin\[375:372\],^gin\[371:368\],^gin\[367:364\],^gin\[363:360\],^gin\[359:356\],^gin\[355:352\]\};
  assign zin\[103:96\]= \{ ^gin\[415:412\],^gin\[411:408\],^gin\[407:404\],^gin\[403:400\],^gin\[399:396\],^gin\[395:392\],^gin\[391:388\],^gin\[387:384\]\};
  assign zin\[111:104\]= \{ ^gin\[447:444\],^gin\[443:440\],^gin\[439:436\],^gin\[435:432\],^gin\[431:428\],^gin\[427:424\],^gin\[423:420\],^gin\[419:416\]\};
  assign zin\[119:112\]= \{ ^gin\[479:476\],^gin\[475:472\],^gin\[471:468\],^gin\[467:464\],^gin\[463:460\],^gin\[459:456\],^gin\[455:452\],^gin\[451:448\]\};
  assign zin\[127:120\]= \{ ^gin\[511:508\],^gin\[507:504\],^gin\[503:500\],^gin\[499:496\],^gin\[495:492\],^gin\[491:488\],^gin\[487:484\],^gin\[483:480\]\};
 
  assign xin\[0\] = misr_in_i\[404\] ^ misr_in_i\[413\] ^ misr_in_i\[422\] ^ misr_in_i\[431\];
  assign xin\[1\] = misr_in_i\[396\] ^ misr_in_i\[412\] ^ misr_in_i\[421\] ^ misr_in_i\[430\];
  assign xin\[2\] = misr_in_i\[400\] ^ misr_in_i\[409\] ^ misr_in_i\[420\] ^ misr_in_i\[429\];
  assign xin\[3\] = misr_in_i\[397\] ^ misr_in_i\[401\] ^ misr_in_i\[418\] ^ misr_in_i\[428\];
  assign xin\[4\] = misr_in_i\[405\] ^ misr_in_i\[408\] ^ misr_in_i\[417\] ^ misr_in_i\[427\];
  assign xin\[5\] = misr_in_i\[398\] ^ misr_in_i\[402\] ^ misr_in_i\[406\] ^ misr_in_i\[426\];
  assign xin\[6\] = misr_in_i\[410\] ^ misr_in_i\[414\] ^ misr_in_i\[416\] ^ misr_in_i\[425\];
  assign xin\[7\] = misr_in_i\[399\] ^ misr_in_i\[403\] ^ misr_in_i\[407\] ^ misr_in_i\[411\];
  assign xin\[8\] = misr_in_i\[415\] ^ misr_in_i\[419\] ^ misr_in_i\[423\] ^ misr_in_i\[424\];
  assign xin\[9\] = misr_in_i\[368\] ^ misr_in_i\[377\] ^ misr_in_i\[386\] ^ misr_in_i\[395\];
  assign xin\[10\] = misr_in_i\[360\] ^ misr_in_i\[376\] ^ misr_in_i\[385\] ^ misr_in_i\[394\];
  assign xin\[11\] = misr_in_i\[364\] ^ misr_in_i\[373\] ^ misr_in_i\[384\] ^ misr_in_i\[393\];
  assign xin\[12\] = misr_in_i\[361\] ^ misr_in_i\[365\] ^ misr_in_i\[382\] ^ misr_in_i\[392\];
  assign xin\[13\] = misr_in_i\[369\] ^ misr_in_i\[372\] ^ misr_in_i\[381\] ^ misr_in_i\[391\];
  assign xin\[14\] = misr_in_i\[362\] ^ misr_in_i\[366\] ^ misr_in_i\[370\] ^ misr_in_i\[390\];
  assign xin\[15\] = misr_in_i\[374\] ^ misr_in_i\[378\] ^ misr_in_i\[380\] ^ misr_in_i\[389\];
  assign xin\[16\] = misr_in_i\[363\] ^ misr_in_i\[367\] ^ misr_in_i\[371\] ^ misr_in_i\[375\];
  assign xin\[17\] = misr_in_i\[379\] ^ misr_in_i\[383\] ^ misr_in_i\[387\] ^ misr_in_i\[388\];
  assign xin\[18\] = misr_in_i\[332\] ^ misr_in_i\[341\] ^ misr_in_i\[350\] ^ misr_in_i\[359\];
  assign xin\[19\] = misr_in_i\[324\] ^ misr_in_i\[340\] ^ misr_in_i\[349\] ^ misr_in_i\[358\];
  assign xin\[20\] = misr_in_i\[328\] ^ misr_in_i\[337\] ^ misr_in_i\[348\] ^ misr_in_i\[357\];
  assign xin\[21\] = misr_in_i\[325\] ^ misr_in_i\[329\] ^ misr_in_i\[346\] ^ misr_in_i\[356\];
  assign xin\[22\] = misr_in_i\[333\] ^ misr_in_i\[336\] ^ misr_in_i\[345\] ^ misr_in_i\[355\];
  assign xin\[23\] = misr_in_i\[326\] ^ misr_in_i\[330\] ^ misr_in_i\[334\] ^ misr_in_i\[354\];
  assign xin\[24\] = misr_in_i\[338\] ^ misr_in_i\[342\] ^ misr_in_i\[344\] ^ misr_in_i\[353\];
  assign xin\[25\] = misr_in_i\[327\] ^ misr_in_i\[331\] ^ misr_in_i\[335\] ^ misr_in_i\[339\];
  assign xin\[26\] = misr_in_i\[343\] ^ misr_in_i\[347\] ^ misr_in_i\[351\] ^ misr_in_i\[352\];
  assign xin\[27\] = misr_in_i\[296\] ^ misr_in_i\[305\] ^ misr_in_i\[314\] ^ misr_in_i\[323\];
  assign xin\[28\] = misr_in_i\[288\] ^ misr_in_i\[304\] ^ misr_in_i\[313\] ^ misr_in_i\[322\];
  assign xin\[29\] = misr_in_i\[292\] ^ misr_in_i\[301\] ^ misr_in_i\[312\] ^ misr_in_i\[321\];
  assign xin\[30\] = misr_in_i\[289\] ^ misr_in_i\[293\] ^ misr_in_i\[310\] ^ misr_in_i\[320\];
  assign xin\[31\] = misr_in_i\[297\] ^ misr_in_i\[300\] ^ misr_in_i\[309\] ^ misr_in_i\[319\];
  assign xin\[32\] = misr_in_i\[290\] ^ misr_in_i\[294\] ^ misr_in_i\[298\] ^ misr_in_i\[318\];
  assign xin\[33\] = misr_in_i\[302\] ^ misr_in_i\[306\] ^ misr_in_i\[308\] ^ misr_in_i\[317\];
  assign xin\[34\] = misr_in_i\[291\] ^ misr_in_i\[295\] ^ misr_in_i\[299\] ^ misr_in_i\[303\];
  assign xin\[35\] = misr_in_i\[307\] ^ misr_in_i\[311\] ^ misr_in_i\[315\] ^ misr_in_i\[316\];
  assign xin\[36\] = misr_in_i\[260\] ^ misr_in_i\[269\] ^ misr_in_i\[278\] ^ misr_in_i\[287\];
  assign xin\[37\] = misr_in_i\[252\] ^ misr_in_i\[268\] ^ misr_in_i\[277\] ^ misr_in_i\[286\];
  assign xin\[38\] = misr_in_i\[256\] ^ misr_in_i\[265\] ^ misr_in_i\[276\] ^ misr_in_i\[285\];
  assign xin\[39\] = misr_in_i\[253\] ^ misr_in_i\[257\] ^ misr_in_i\[274\] ^ misr_in_i\[284\];
  assign xin\[40\] = misr_in_i\[261\] ^ misr_in_i\[264\] ^ misr_in_i\[273\] ^ misr_in_i\[283\];
  assign xin\[41\] = misr_in_i\[254\] ^ misr_in_i\[258\] ^ misr_in_i\[262\] ^ misr_in_i\[282\];
  assign xin\[42\] = misr_in_i\[266\] ^ misr_in_i\[270\] ^ misr_in_i\[272\] ^ misr_in_i\[281\];
  assign xin\[43\] = misr_in_i\[255\] ^ misr_in_i\[259\] ^ misr_in_i\[263\] ^ misr_in_i\[267\];
  assign xin\[44\] = misr_in_i\[271\] ^ misr_in_i\[275\] ^ misr_in_i\[279\] ^ misr_in_i\[280\];
  assign xin\[45\] = misr_in_i\[224\] ^ misr_in_i\[233\] ^ misr_in_i\[242\] ^ misr_in_i\[251\];
  assign xin\[46\] = misr_in_i\[216\] ^ misr_in_i\[232\] ^ misr_in_i\[241\] ^ misr_in_i\[250\];
  assign xin\[47\] = misr_in_i\[220\] ^ misr_in_i\[229\] ^ misr_in_i\[240\] ^ misr_in_i\[249\];
  assign xin\[48\] = misr_in_i\[217\] ^ misr_in_i\[221\] ^ misr_in_i\[238\] ^ misr_in_i\[248\];
  assign xin\[49\] = misr_in_i\[225\] ^ misr_in_i\[228\] ^ misr_in_i\[237\] ^ misr_in_i\[247\];
  assign xin\[50\] = misr_in_i\[218\] ^ misr_in_i\[222\] ^ misr_in_i\[226\] ^ misr_in_i\[246\];
  assign xin\[51\] = misr_in_i\[230\] ^ misr_in_i\[234\] ^ misr_in_i\[236\] ^ misr_in_i\[245\];
  assign xin\[52\] = misr_in_i\[219\] ^ misr_in_i\[223\] ^ misr_in_i\[227\] ^ misr_in_i\[231\];
  assign xin\[53\] = misr_in_i\[235\] ^ misr_in_i\[239\] ^ misr_in_i\[243\] ^ misr_in_i\[244\];
  assign xin\[54\] = misr_in_i\[188\] ^ misr_in_i\[197\] ^ misr_in_i\[206\] ^ misr_in_i\[215\];
  assign xin\[55\] = misr_in_i\[180\] ^ misr_in_i\[196\] ^ misr_in_i\[205\] ^ misr_in_i\[214\];
  assign xin\[56\] = misr_in_i\[184\] ^ misr_in_i\[193\] ^ misr_in_i\[204\] ^ misr_in_i\[213\];
  assign xin\[57\] = misr_in_i\[181\] ^ misr_in_i\[185\] ^ misr_in_i\[202\] ^ misr_in_i\[212\];
  assign xin\[58\] = misr_in_i\[189\] ^ misr_in_i\[192\] ^ misr_in_i\[201\] ^ misr_in_i\[211\];
  assign xin\[59\] = misr_in_i\[182\] ^ misr_in_i\[186\] ^ misr_in_i\[190\] ^ misr_in_i\[210\];
  assign xin\[60\] = misr_in_i\[194\] ^ misr_in_i\[198\] ^ misr_in_i\[200\] ^ misr_in_i\[209\];
  assign xin\[61\] = misr_in_i\[183\] ^ misr_in_i\[187\] ^ misr_in_i\[191\] ^ misr_in_i\[195\];
  assign xin\[62\] = misr_in_i\[199\] ^ misr_in_i\[203\] ^ misr_in_i\[207\] ^ misr_in_i\[208\];
  assign xin\[63\] = misr_in_i\[152\] ^ misr_in_i\[161\] ^ misr_in_i\[170\] ^ misr_in_i\[179\];
  assign xin\[64\] = misr_in_i\[144\] ^ misr_in_i\[160\] ^ misr_in_i\[169\] ^ misr_in_i\[178\];
  assign xin\[65\] = misr_in_i\[148\] ^ misr_in_i\[157\] ^ misr_in_i\[168\] ^ misr_in_i\[177\];
  assign xin\[66\] = misr_in_i\[145\] ^ misr_in_i\[149\] ^ misr_in_i\[166\] ^ misr_in_i\[176\];
  assign xin\[67\] = misr_in_i\[153\] ^ misr_in_i\[156\] ^ misr_in_i\[165\] ^ misr_in_i\[175\];
  assign xin\[68\] = misr_in_i\[146\] ^ misr_in_i\[150\] ^ misr_in_i\[154\] ^ misr_in_i\[174\];
  assign xin\[69\] = misr_in_i\[158\] ^ misr_in_i\[162\] ^ misr_in_i\[164\] ^ misr_in_i\[173\];
  assign xin\[70\] = misr_in_i\[147\] ^ misr_in_i\[151\] ^ misr_in_i\[155\] ^ misr_in_i\[159\];
  assign xin\[71\] = misr_in_i\[163\] ^ misr_in_i\[167\] ^ misr_in_i\[171\] ^ misr_in_i\[172\];
  assign xin\[72\] = misr_in_i\[116\] ^ misr_in_i\[125\] ^ misr_in_i\[134\] ^ misr_in_i\[143\];
  assign xin\[73\] = misr_in_i\[108\] ^ misr_in_i\[124\] ^ misr_in_i\[133\] ^ misr_in_i\[142\];
  assign xin\[74\] = misr_in_i\[112\] ^ misr_in_i\[121\] ^ misr_in_i\[132\] ^ misr_in_i\[141\];
  assign xin\[75\] = misr_in_i\[109\] ^ misr_in_i\[113\] ^ misr_in_i\[130\] ^ misr_in_i\[140\];
  assign xin\[76\] = misr_in_i\[117\] ^ misr_in_i\[120\] ^ misr_in_i\[129\] ^ misr_in_i\[139\];
  assign xin\[77\] = misr_in_i\[110\] ^ misr_in_i\[114\] ^ misr_in_i\[118\] ^ misr_in_i\[138\];
  assign xin\[78\] = misr_in_i\[122\] ^ misr_in_i\[126\] ^ misr_in_i\[128\] ^ misr_in_i\[137\];
  assign xin\[79\] = misr_in_i\[111\] ^ misr_in_i\[115\] ^ misr_in_i\[119\] ^ misr_in_i\[123\];
  assign xin\[80\] = misr_in_i\[127\] ^ misr_in_i\[131\] ^ misr_in_i\[135\] ^ misr_in_i\[136\];
  assign xin\[81\] = misr_in_i\[80\] ^ misr_in_i\[89\] ^ misr_in_i\[98\] ^ misr_in_i\[107\];
  assign xin\[82\] = misr_in_i\[72\] ^ misr_in_i\[88\] ^ misr_in_i\[97\] ^ misr_in_i\[106\];
  assign xin\[83\] = misr_in_i\[76\] ^ misr_in_i\[85\] ^ misr_in_i\[96\] ^ misr_in_i\[105\];
  assign xin\[84\] = misr_in_i\[73\] ^ misr_in_i\[77\] ^ misr_in_i\[94\] ^ misr_in_i\[104\];
  assign xin\[85\] = misr_in_i\[81\] ^ misr_in_i\[84\] ^ misr_in_i\[93\] ^ misr_in_i\[103\];
  assign xin\[86\] = misr_in_i\[74\] ^ misr_in_i\[78\] ^ misr_in_i\[82\] ^ misr_in_i\[102\];
  assign xin\[87\] = misr_in_i\[86\] ^ misr_in_i\[90\] ^ misr_in_i\[92\] ^ misr_in_i\[101\];
  assign xin\[88\] = misr_in_i\[75\] ^ misr_in_i\[79\] ^ misr_in_i\[83\] ^ misr_in_i\[87\];
  assign xin\[89\] = misr_in_i\[91\] ^ misr_in_i\[95\] ^ misr_in_i\[99\] ^ misr_in_i\[100\];
  assign xin\[90\] = misr_in_i\[44\] ^ misr_in_i\[53\] ^ misr_in_i\[62\] ^ misr_in_i\[71\];
  assign xin\[91\] = misr_in_i\[36\] ^ misr_in_i\[52\] ^ misr_in_i\[61\] ^ misr_in_i\[70\];
  assign xin\[92\] = misr_in_i\[40\] ^ misr_in_i\[49\] ^ misr_in_i\[60\] ^ misr_in_i\[69\];
  assign xin\[93\] = misr_in_i\[37\] ^ misr_in_i\[41\] ^ misr_in_i\[58\] ^ misr_in_i\[68\];
  assign xin\[94\] = misr_in_i\[45\] ^ misr_in_i\[48\] ^ misr_in_i\[57\] ^ misr_in_i\[67\];
  assign xin\[95\] = misr_in_i\[38\] ^ misr_in_i\[42\] ^ misr_in_i\[46\] ^ misr_in_i\[66\];
  assign xin\[96\] = misr_in_i\[50\] ^ misr_in_i\[54\] ^ misr_in_i\[56\] ^ misr_in_i\[65\];
  assign xin\[97\] = misr_in_i\[39\] ^ misr_in_i\[43\] ^ misr_in_i\[47\] ^ misr_in_i\[51\];
  assign xin\[98\] = misr_in_i\[55\] ^ misr_in_i\[59\] ^ misr_in_i\[63\] ^ misr_in_i\[64\];
  assign xin\[99\] = misr_in_i\[8\] ^ misr_in_i\[17\] ^ misr_in_i\[26\] ^ misr_in_i\[35\];
  assign xin\[100\] = misr_in_i\[0\] ^ misr_in_i\[16\] ^ misr_in_i\[25\] ^ misr_in_i\[34\];
  assign xin\[101\] = misr_in_i\[4\] ^ misr_in_i\[13\] ^ misr_in_i\[24\] ^ misr_in_i\[33\];
  assign xin\[102\] = misr_in_i\[1\] ^ misr_in_i\[5\] ^ misr_in_i\[22\] ^ misr_in_i\[32\];
  assign xin\[103\] = misr_in_i\[9\] ^ misr_in_i\[12\] ^ misr_in_i\[21\] ^ misr_in_i\[31\];
  assign xin\[104\] = misr_in_i\[2\] ^ misr_in_i\[6\] ^ misr_in_i\[10\] ^ misr_in_i\[30\];
  assign xin\[105\] = misr_in_i\[14\] ^ misr_in_i\[18\] ^ misr_in_i\[20\] ^ misr_in_i\[29\];
  assign xin\[106\] = misr_in_i\[3\] ^ misr_in_i\[7\] ^ misr_in_i\[11\] ^ misr_in_i\[15\];
  assign xin\[107\] = misr_in_i\[19\] ^ misr_in_i\[23\] ^ misr_in_i\[27\] ^ misr_in_i\[28\];
  assign xin\[108\] = misr_in_i\[480\] ^ misr_in_i\[489\] ^ misr_in_i\[498\] ^ misr_in_i\[507\];
  assign xin\[109\] = misr_in_i\[472\] ^ misr_in_i\[488\] ^ misr_in_i\[497\] ^ misr_in_i\[506\];
  assign xin\[110\] = misr_in_i\[508\] ^ misr_in_i\[485\] ^ misr_in_i\[496\] ^ misr_in_i\[505\];
  assign xin\[111\] = misr_in_i\[473\] ^ misr_in_i\[477\] ^ misr_in_i\[494\] ^ misr_in_i\[504\];
  assign xin\[112\] = misr_in_i\[481\] ^ misr_in_i\[509\] ^ misr_in_i\[493\] ^ misr_in_i\[503\];
  assign xin\[113\] = misr_in_i\[474\] ^ misr_in_i\[478\] ^ misr_in_i\[482\] ^ misr_in_i\[502\];
  assign xin\[114\] = misr_in_i\[486\] ^ misr_in_i\[490\] ^ misr_in_i\[510\] ^ misr_in_i\[501\];
  assign xin\[115\] = misr_in_i\[475\] ^ misr_in_i\[479\] ^ misr_in_i\[483\] ^ misr_in_i\[487\];
  assign xin\[116\] = misr_in_i\[491\] ^ misr_in_i\[495\] ^ misr_in_i\[499\] ^ misr_in_i\[511\];
  assign xin\[117\] = misr_in_i\[476\] ^ misr_in_i\[484\] ^ misr_in_i\[492\] ^ misr_in_i\[500\];
  assign xin\[118\] = misr_in_i\[440\] ^ misr_in_i\[449\] ^ misr_in_i\[458\] ^ misr_in_i\[467\];
  assign xin\[119\] = misr_in_i\[432\] ^ misr_in_i\[448\] ^ misr_in_i\[457\] ^ misr_in_i\[466\];
  assign xin\[120\] = misr_in_i\[468\] ^ misr_in_i\[445\] ^ misr_in_i\[456\] ^ misr_in_i\[465\];
  assign xin\[121\] = misr_in_i\[433\] ^ misr_in_i\[437\] ^ misr_in_i\[454\] ^ misr_in_i\[464\];
  assign xin\[122\] = misr_in_i\[441\] ^ misr_in_i\[469\] ^ misr_in_i\[453\] ^ misr_in_i\[463\];
  assign xin\[123\] = misr_in_i\[434\] ^ misr_in_i\[438\] ^ misr_in_i\[442\] ^ misr_in_i\[462\];
  assign xin\[124\] = misr_in_i\[446\] ^ misr_in_i\[450\] ^ misr_in_i\[470\] ^ misr_in_i\[461\];
  assign xin\[125\] = misr_in_i\[435\] ^ misr_in_i\[439\] ^ misr_in_i\[443\] ^ misr_in_i\[447\];
  assign xin\[126\] = misr_in_i\[451\] ^ misr_in_i\[455\] ^ misr_in_i\[459\] ^ misr_in_i\[471\];
  assign xin\[127\] = misr_in_i\[436\] ^ misr_in_i\[444\] ^ misr_in_i\[452\] ^ misr_in_i\[460\];

endmodule"
puts "
//------------------------------------------------------------------------------
// MISR block definition 
//------------------------------------------------------------------------------"
puts "module DFT_misr_$gen_bist_fail (misr_reset, diag_mode, bist_ck, misr_si, 
misr_scan, misr_scb, cpct_out, diag_si, bist_fail, misr_so );

input misr_reset, diag_mode, bist_ck, misr_scan;
input \[3:0\] misr_scb;
input \[127:0\] cpct_out;
input  misr_si;
input  \[15:0\] diag_si;
output bist_fail;
output \[15:0\] misr_so;
wire xinp, feedb;
wire \[127:0\] i;
wire \[127:0\] i_l;
reg  \[127:0\] o;
wire \[15:1\] a;
wire \[15:1\] diag_in;
wire misr_shift;

  assign feedb = o\[127\] & !misr_scan & (!diag_mode ||
      (misr_scb\[0\] & misr_scb\[1\] & misr_scb\[2\] & misr_scb\[3\]));


  assign xinp       =             cpct_out\[0\]      ^ feedb;
  assign i\[127:30\]  = o\[126:29\] ^ cpct_out\[127:30\];
  assign i\[29\]      = o\[28\]     ^ cpct_out\[29\]     ^ feedb;
  assign i\[28\]      = o\[27\]     ^ cpct_out\[28\];
  assign i\[27\]      = o\[26\]     ^ cpct_out\[27\]     ^ feedb;
  assign i\[26:3\]    = o\[25:2\]   ^ cpct_out\[26:3\];
  assign i\[2\]       = o\[1\]      ^ cpct_out\[2\]      ^ feedb;
  assign i\[1\]       = o\[0\]      ^ cpct_out\[1\];
  assign i\[0\]       = (~misr_scan)?xinp:misr_si;



  assign misr_shift = !(misr_scb\[0\] | misr_scb\[1\] | misr_scb\[2\] | misr_scb\[3\]);
  assign diag_in\[15:1\] = (misr_shift)?~diag_si\[15:1\]:\{15\{1'b1\}\};

  assign a\[15\] = i\[8\] & diag_in\[15\];
  assign a\[14\] = i\[16\] & diag_in\[14\];
  assign a\[13\] = i\[24\] & diag_in\[13\];
  assign a\[12\] = i\[32\] & diag_in\[12\];
  assign a\[11\] = i\[40\] & diag_in\[11\];
  assign a\[10\] = i\[48\] & diag_in\[10\];
  assign a\[9\] = i\[56\] & diag_in\[9\];
  assign a\[8\] = i\[64\] & diag_in\[8\];
  assign a\[7\] = i\[72\] & diag_in\[7\];
  assign a\[6\] = i\[80\] & diag_in\[6\];
  assign a\[5\] = i\[88\] & diag_in\[5\];
  assign a\[4\] = i\[96\] & diag_in\[4\];
  assign a\[3\] = i\[104\] & diag_in\[3\];
  assign a\[2\] = i\[112\] & diag_in\[2\];
  assign a\[1\] = i\[120\] & diag_in\[1\];
  assign misr_so\[0\] = o\[127\];
  assign misr_so\[1\] = o\[119\];
  assign misr_so\[2\] = o\[111\];
  assign misr_so\[3\] = o\[103\];
  assign misr_so\[4\] = o\[95\];  
  assign misr_so\[5\] = o\[87\];
  assign misr_so\[6\] = o\[79\];
  assign misr_so\[7\] = o\[71\];
  assign misr_so\[8\] = o\[63\];  
  assign misr_so\[9\] = o\[55\];
  assign misr_so\[10\] = o\[47\];
  assign misr_so\[11\] = o\[39\];
  assign misr_so\[12\] = o\[31\];  
  assign misr_so\[13\] = o\[23\];
  assign misr_so\[14\] = o\[15\];
  assign misr_so\[15\] = o\[7\];

  assign i_l\[31:0\]  = { i\[31:25\], a\[13\], i\[23:17\], a\[14\], i\[15:9\],  a\[15\], i\[7:0\] };
  assign i_l\[63:32\] = { i\[63:57\], a\[9\],  i\[55:49\], a\[10\], i\[47:41\], a\[11\], i\[39:33\], a\[12\]  } ;
  assign i_l\[64\] = a\[8\];
  assign i_l\[71:65\] = i\[71:65\];
  assign i_l\[72\] = a\[7\];
  assign i_l\[79:73\] = i\[79:73\];
  assign i_l\[80\] = a\[6\];
  assign i_l\[87:81\] = i\[87:81\];
  assign i_l\[88\] = a\[5\];
  assign i_l\[95:89\] = i\[95:89\];
  assign i_l\[96\] = a\[4\];
  assign i_l\[103:97\] = i\[103:97\];
  assign i_l\[104\] = a\[3\];
  assign i_l\[111:105\] = i\[111:105\];
  assign i_l\[112\] = a\[2\];
  assign i_l\[119:113\] = i\[119:113\];
  assign i_l\[120\] = a\[1\];
  assign i_l\[127:121\] = i\[127:121\];

  always @(posedge bist_ck or posedge misr_reset)
    if (misr_reset) o\[127:0\] <= 128'b0;
    else  o\[127:0\] <= i_l\[127:0\];"

if {$gen_bist_fail==1} {
   puts "  DW_or_tree \#(128)  U_or_tree_i(.a(o), .b(bist_fail));"
 } else { 
   puts "  assign bist_fail = 1'b0;"
}
puts "endmodule"





puts "
//------------------------------------------------------------------------------
// BIST CODEC top level definition
//------------------------------------------------------------------------------"
puts "module LBIST_CODEC(bist_reset, bist_mode, auto_mode, bist_diag, fast_clock_enable, 
diag_data_valid, lfsr_se,lfsr_si, lfsr_so, shadow_si, shadow_so, core_si, core_so, 
bist_bypass, reuse_seed_gated, prpg_clk, misr_clk, misr_scb, bist_fail);
input	  bist_reset, bist_mode, auto_mode, bist_diag;
output    fast_clock_enable;
output    diag_data_valid;
input	  lfsr_se;"
if { $codec_count ==1 } {
    puts "output      shadow_so;
output	 lfsr_so;
input     lfsr_si;"

} else {
    puts "output	  \[[expr $codec_count-1]:0\] shadow_so;
output	  \[[expr ($codec_count * $diag_output)-1]:0\] lfsr_so;
input     \[[expr $codec_count-1]: 0\] lfsr_si;"
}
puts "
input	  \[[expr ($codec_count * $shadow_width)-1]:0\] shadow_si;

output	  \[[expr ($codec_count * $chain_count)-1]: 0\] core_si;
input	  \[[expr ($codec_count * $chain_count)-1]: 0\] core_so;
input	  bist_bypass;
input     reuse_seed_gated;
input     prpg_clk ;
input     misr_clk ;
input     \[3:0\] misr_scb;
output    bist_fail;

wire \[[expr ($codec_count*16)-1]:0\] lfsr_so_l;"
if { $codec_count==1 } {
    puts "wire bist_fail_bus;
wire prpg_so;"
} else {
    puts "
wire \[[expr $codec_count-1]:0\] bist_fail_bus;
wire \[[expr $codec_count-1]:0\] prpg_so;"
}

if { $chain_count==1 } {
	puts " wire  core_so_i;
wire core_so_l;
wire core_si_i;"
} else {
	puts "wire \[[expr ($codec_count*$chain_count) -1]:0\] core_so_i; 
wire \[[expr ($codec_count*$chain_count) -1]:0\] core_so_l; 
wire \[[expr ($codec_count*$chain_count) -1]:0\] core_si_i;"
}
puts "
wire \[15:0\] diag_si;
wire bist_diag_i;
wire shadow_scan;
wire misr_reset;
  assign core_so_i = (bist_bypass)?core_si_i:core_so_l;"

if { $shadow_width>1 } {
    puts "  assign shadow_scan = bist_mode;"
} else {
    puts "  assign shadow_scan = 1'b0;"
}
puts "  assign bist_diag_i = bist_diag & bist_mode;"
if {$gen_bist_fail==1} {
    puts "  DW_or_tree #([expr $codec_count])  U_or_tree_i(.a(bist_fail_bus), .b(bist_fail));"
} else { 
   puts "  assign bist_fail = 1'b0;"
}
if {$diag_output == 1} {
    puts "  assign diag_si = {16 {1'b0}};"
}
for {set n 0} {$n<$codec_count} {incr n} {
    puts "  DFT_prpg_[expr $bist_type]_[expr $prpg_length]_[expr $chain_count]_[expr $shadow_width]" 
    if { $codec_count ==1 } {
	puts "    U_prpg_i(.bist_ck(prpg_clk), .bist_mode(bist_mode), .bist_bypass(bist_bypass), .prpg_scan(lfsr_se),"
	puts "             .prpg_si(lfsr_si), .shadow_chain_so(shadow_so), .prpg_so(prpg_so),"
    } else {
	puts "    U_prpg_i_[expr $n](.bist_ck(prpg_clk), .bist_mode(bist_mode), .bist_bypass(bist_bypass), .prpg_scan(lfsr_se),"
	puts "             .prpg_si(lfsr_si\[[expr $n]\]), .shadow_chain_so(shadow_so\[$n\]), .prpg_so(prpg_so\[$n\]),"
    }
    if { $chain_count == 1 } {
	puts "             .prpg_out(core_si_i),"
    } else {
	puts "             .prpg_out(core_si_i\[[expr $n*$chain_count+($chain_count-1)]:[expr $n*$chain_count]\]),"
    }
    puts "             .shadow_transfer(reuse_seed_gated),
             .shadow_scan(shadow_scan),
             .shadow_si(shadow_si\[[ expr $n*$shadow_width+($shadow_width-1)]:[expr $n*$shadow_width]\]));"
    
    
    if { $codec_count ==1 } {
    puts "  DFT_sign_[expr $chain_count]_[expr $gen_bist_fail] 
    U_misr_i(.misr_reset(misr_reset),
             .bist_ck(misr_clk), .bist_mode(bist_mode),
             .bist_bypass(bist_bypass),
             .diag_mode(bist_diag_i),
             .bist_fail(bist_fail_bus),
             .misr_so(lfsr_so_l),
             .misr_si(prpg_so),"
    } else {
    puts "  DFT_sign_[expr $chain_count]_[expr $gen_bist_fail] 
    U_misr_i_[expr $n](.misr_reset(misr_reset),
                .bist_ck(misr_clk), .bist_mode(bist_mode),
                .bist_bypass(bist_bypass),
                .diag_mode(bist_diag_i),
	        .bist_fail(bist_fail_bus\[$n\]),
                .misr_so(lfsr_so_l\[[expr $n*16+15]:[expr $n*16]\]),
                .misr_si(prpg_so\[$n\]),"
    }
    if { $chain_count == 1 } {
	puts "    .misr_in(core_so_i)," 
    }  else {
	puts "    .misr_in(core_so_i\[[expr $n*$chain_count+($chain_count-1)]:[expr $n*$chain_count]\]), "
    }
    puts "    .misr_scan(lfsr_se), .misr_scb(misr_scb), .diag_si(diag_si));"
    puts ""
    if {$diag_output == 1} {
	if { $codec_count ==1 } {
	    puts "  assign lfsr_so = lfsr_so_l;"
	} else {
	    puts "  assign lfsr_so\[$n\] = lfsr_so_l\[[expr $n*16]\];"
	}
    }
}


puts "  assign core_so_l = core_so;
  assign core_si = core_si_i;
  assign misr_reset = bist_reset & (~ auto_mode);"
puts "endmodule"
