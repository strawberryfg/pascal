var d:array[1..200,1..3,0..2] of longint;
    f:array[1..3,0..2] of longint;
    n,i,j,k,l:longint;
begin
d[1,1,0]:=56;d[1,1,1]:=723;d[1,1,2]:=68;d[1,2,0]:=233;d[1,2,1]:=289;d[1,2,2]:=15;d[1,3,0]:=581;d[1,3,1]:=705;d[1,3,2]:=307;d[2,1,0]:=540;d[2,1,1]:=443;d[2,1,2]:=89;d[2,2,0]:=211;d[2,2,1]:=751;d[2,2,2]:=122;d[2,3,0]:=389;d[2,3,1]:=362;d[2,3,2]:=819;
d[3,1,0]:=943;d[3,1,1]:=259;d[3,1,2]:=633;d[3,2,0]:=652;d[3,2,1]:=757;d[3,2,2]:=19;d[3,3,0]:=639;d[3,3,1]:=6;d[3,3,2]:=13;d[4,1,0]:=287;d[4,1,1]:=809;d[4,1,2]:=925;d[4,2,0]:=855;d[4,2,1]:=145;d[4,2,2]:=954;d[4,3,0]:=606;d[4,3,1]:=536;d[4,3,2]:=418;
d[5,1,0]:=228;d[5,1,1]:=191;d[5,1,2]:=12;d[5,2,0]:=705;d[5,2,1]:=933;d[5,2,2]:=693;d[5,3,0]:=535;d[5,3,1]:=398;d[5,3,2]:=170;d[6,1,0]:=304;d[6,1,1]:=107;d[6,1,2]:=415;d[6,2,0]:=838;d[6,2,1]:=316;d[6,2,2]:=423;d[6,3,0]:=905;d[6,3,1]:=490;d[6,3,2]:=930;
d[7,1,0]:=356;d[7,1,1]:=484;d[7,1,2]:=191;d[7,2,0]:=647;d[7,2,1]:=6;d[7,2,2]:=490;d[7,3,0]:=667;d[7,3,1]:=336;d[7,3,2]:=154;d[8,1,0]:=465;d[8,1,1]:=767;d[8,1,2]:=743;d[8,2,0]:=494;d[8,2,1]:=959;d[8,2,2]:=748;d[8,3,0]:=565;d[8,3,1]:=394;d[8,3,2]:=926;
d[9,1,0]:=221;d[9,1,1]:=478;d[9,1,2]:=156;d[9,2,0]:=228;d[9,2,1]:=591;d[9,2,2]:=72;d[9,3,0]:=785;d[9,3,1]:=629;d[9,3,2]:=440;d[10,1,0]:=398;d[10,1,1]:=704;d[10,1,2]:=912;d[10,2,0]:=764;d[10,2,1]:=165;d[10,2,2]:=869;d[10,3,0]:=685;d[10,3,1]:=477;d[10,3,2]:=392;
d[11,1,0]:=856;d[11,1,1]:=875;d[11,1,2]:=15;d[11,2,0]:=7;d[11,2,1]:=863;d[11,2,2]:=989;d[11,3,0]:=987;d[11,3,1]:=873;d[11,3,2]:=17;d[12,1,0]:=143;d[12,1,1]:=485;d[12,1,2]:=412;d[12,2,0]:=67;d[12,2,1]:=167;d[12,2,2]:=652;d[12,3,0]:=131;d[12,3,1]:=716;d[12,3,2]:=933;
d[13,1,0]:=993;d[13,1,1]:=21;d[13,1,2]:=622;d[13,2,0]:=962;d[13,2,1]:=958;d[13,2,2]:=979;d[13,3,0]:=275;d[13,3,1]:=683;d[13,3,2]:=296;d[14,1,0]:=128;d[14,1,1]:=219;d[14,1,2]:=612;d[14,2,0]:=342;d[14,2,1]:=470;d[14,2,2]:=727;d[14,3,0]:=789;d[14,3,1]:=678;d[14,3,2]:=550;
d[15,1,0]:=591;d[15,1,1]:=896;d[15,1,2]:=695;d[15,2,0]:=296;d[15,2,1]:=699;d[15,2,2]:=598;d[15,3,0]:=498;d[15,3,1]:=800;d[15,3,2]:=795;d[16,1,0]:=367;d[16,1,1]:=648;d[16,1,2]:=718;d[16,2,0]:=557;d[16,2,1]:=924;d[16,2,2]:=575;d[16,3,0]:=78;d[16,3,1]:=846;d[16,3,2]:=726;
d[17,1,0]:=796;d[17,1,1]:=961;d[17,1,2]:=883;d[17,2,0]:=157;d[17,2,1]:=953;d[17,2,2]:=271;d[17,3,0]:=962;d[17,3,1]:=988;d[17,3,2]:=192;d[18,1,0]:=937;d[18,1,1]:=991;d[18,1,2]:=334;d[18,2,0]:=695;d[18,2,1]:=367;d[18,2,2]:=361;d[18,3,0]:=808;d[18,3,1]:=474;d[18,3,2]:=884;
d[19,1,0]:=474;d[19,1,1]:=670;d[19,1,2]:=924;d[19,2,0]:=612;d[19,2,1]:=89;d[19,2,2]:=759;d[19,3,0]:=487;d[19,3,1]:=599;d[19,3,2]:=160;d[20,1,0]:=920;d[20,1,1]:=559;d[20,1,2]:=451;d[20,2,0]:=381;d[20,2,1]:=304;d[20,2,2]:=927;d[20,3,0]:=420;d[20,3,1]:=881;d[20,3,2]:=958;
d[21,1,0]:=705;d[21,1,1]:=636;d[21,1,2]:=17;d[21,2,0]:=711;d[21,2,1]:=58;d[21,2,2]:=694;d[21,3,0]:=53;d[21,3,1]:=36;d[21,3,2]:=658;d[22,1,0]:=653;d[22,1,1]:=323;d[22,1,2]:=411;d[22,2,0]:=664;d[22,2,1]:=320;d[22,2,2]:=643;d[22,3,0]:=528;d[22,3,1]:=789;d[22,3,2]:=851;
d[23,1,0]:=509;d[23,1,1]:=572;d[23,1,2]:=36;d[23,2,0]:=849;d[23,2,1]:=361;d[23,2,2]:=813;d[23,3,0]:=323;d[23,3,1]:=38;d[23,3,2]:=526;d[24,1,0]:=91;d[24,1,1]:=260;d[24,1,2]:=772;d[24,2,0]:=726;d[24,2,1]:=691;d[24,2,2]:=951;d[24,3,0]:=578;d[24,3,1]:=803;d[24,3,2]:=148;
d[25,1,0]:=371;d[25,1,1]:=206;d[25,1,2]:=520;d[25,2,0]:=984;d[25,2,1]:=358;d[25,2,2]:=564;d[25,3,0]:=134;d[25,3,1]:=224;d[25,3,2]:=340;d[26,1,0]:=590;d[26,1,1]:=910;d[26,1,2]:=254;d[26,2,0]:=529;d[26,2,1]:=122;d[26,2,2]:=275;d[26,3,0]:=5;d[26,3,1]:=117;d[26,3,2]:=524;
d[27,1,0]:=153;d[27,1,1]:=696;d[27,1,2]:=423;d[27,2,0]:=135;d[27,2,1]:=13;d[27,2,2]:=709;d[27,3,0]:=525;d[27,3,1]:=102;d[27,3,2]:=607;d[28,1,0]:=539;d[28,1,1]:=940;d[28,1,2]:=129;d[28,2,0]:=285;d[28,2,1]:=824;d[28,2,2]:=767;d[28,3,0]:=831;d[28,3,1]:=990;d[28,3,2]:=774;
d[29,1,0]:=238;d[29,1,1]:=923;d[29,1,2]:=956;d[29,2,0]:=112;d[29,2,1]:=350;d[29,2,2]:=153;d[29,3,0]:=502;d[29,3,1]:=845;d[29,3,2]:=607;d[30,1,0]:=246;d[30,1,1]:=920;d[30,1,2]:=669;d[30,2,0]:=317;d[30,2,1]:=722;d[30,2,2]:=645;d[30,3,0]:=956;d[30,3,1]:=287;d[30,3,2]:=358;
d[31,1,0]:=147;d[31,1,1]:=378;d[31,1,2]:=981;d[31,2,0]:=678;d[31,2,1]:=825;d[31,2,2]:=206;d[31,3,0]:=25;d[31,3,1]:=800;d[31,3,2]:=403;d[32,1,0]:=223;d[32,1,1]:=14;d[32,1,2]:=921;d[32,2,0]:=744;d[32,2,1]:=967;d[32,2,2]:=820;d[32,3,0]:=373;d[32,3,1]:=594;d[32,3,2]:=371;
d[33,1,0]:=428;d[33,1,1]:=725;d[33,1,2]:=679;d[33,2,0]:=743;d[33,2,1]:=336;d[33,2,2]:=64;d[33,3,0]:=850;d[33,3,1]:=171;d[33,3,2]:=890;d[34,1,0]:=207;d[34,1,1]:=956;d[34,1,2]:=16;d[34,2,0]:=59;d[34,2,1]:=266;d[34,2,2]:=225;d[34,3,0]:=948;d[34,3,1]:=315;d[34,3,2]:=907;
d[35,1,0]:=664;d[35,1,1]:=159;d[35,1,2]:=293;d[35,2,0]:=72;d[35,2,1]:=736;d[35,2,2]:=776;d[35,3,0]:=55;d[35,3,1]:=681;d[35,3,2]:=17;d[36,1,0]:=95;d[36,1,1]:=512;d[36,1,2]:=885;d[36,2,0]:=826;d[36,2,1]:=426;d[36,2,2]:=938;d[36,3,0]:=16;d[36,3,1]:=128;d[36,3,2]:=810;
d[37,1,0]:=692;d[37,1,1]:=803;d[37,1,2]:=807;d[37,2,0]:=599;d[37,2,1]:=294;d[37,2,2]:=100;d[37,3,0]:=573;d[37,3,1]:=718;d[37,3,2]:=379;d[38,1,0]:=704;d[38,1,1]:=780;d[38,1,2]:=255;d[38,2,0]:=320;d[38,2,1]:=27;d[38,2,2]:=65;d[38,3,0]:=178;d[38,3,1]:=846;d[38,3,2]:=142;
d[39,1,0]:=904;d[39,1,1]:=978;d[39,1,2]:=784;d[39,2,0]:=948;d[39,2,1]:=183;d[39,2,2]:=164;d[39,3,0]:=140;d[39,3,1]:=353;d[39,3,2]:=808;d[40,1,0]:=610;d[40,1,1]:=45;d[40,1,2]:=183;d[40,2,0]:=707;d[40,2,1]:=320;d[40,2,2]:=365;d[40,3,0]:=435;d[40,3,1]:=882;d[40,3,2]:=480;
d[41,1,0]:=241;d[41,1,1]:=580;d[41,1,2]:=587;d[41,2,0]:=964;d[41,2,1]:=208;d[41,2,2]:=377;d[41,3,0]:=815;d[41,3,1]:=390;d[41,3,2]:=149;d[42,1,0]:=976;d[42,1,1]:=738;d[42,1,2]:=440;d[42,2,0]:=174;d[42,2,1]:=990;d[42,2,2]:=731;d[42,3,0]:=841;d[42,3,1]:=401;d[42,3,2]:=330;
d[43,1,0]:=350;d[43,1,1]:=355;d[43,1,2]:=194;d[43,2,0]:=598;d[43,2,1]:=948;d[43,2,2]:=306;d[43,3,0]:=364;d[43,3,1]:=584;d[43,3,2]:=719;d[44,1,0]:=767;d[44,1,1]:=232;d[44,1,2]:=766;d[44,2,0]:=264;d[44,2,1]:=34;d[44,2,2]:=495;d[44,3,0]:=165;d[44,3,1]:=866;d[44,3,2]:=99;
d[45,1,0]:=392;d[45,1,1]:=651;d[45,1,2]:=552;d[45,2,0]:=607;d[45,2,1]:=401;d[45,2,2]:=55;d[45,3,0]:=531;d[45,3,1]:=976;d[45,3,2]:=76;d[46,1,0]:=251;d[46,1,1]:=943;d[46,1,2]:=545;d[46,2,0]:=415;d[46,2,1]:=666;d[46,2,2]:=612;d[46,3,0]:=653;d[46,3,1]:=13;d[46,3,2]:=599;
d[47,1,0]:=129;d[47,1,1]:=66;d[47,1,2]:=770;d[47,2,0]:=564;d[47,2,1]:=693;d[47,2,2]:=791;d[47,3,0]:=33;d[47,3,1]:=660;d[47,3,2]:=531;d[48,1,0]:=465;d[48,1,1]:=543;d[48,1,2]:=795;d[48,2,0]:=436;d[48,2,1]:=95;d[48,2,2]:=638;d[48,3,0]:=591;d[48,3,1]:=793;d[48,3,2]:=842;
d[49,1,0]:=402;d[49,1,1]:=209;d[49,1,2]:=726;d[49,2,0]:=785;d[49,2,1]:=190;d[49,2,2]:=399;d[49,3,0]:=455;d[49,3,1]:=732;d[49,3,2]:=664;d[50,1,0]:=631;d[50,1,1]:=158;d[50,1,2]:=55;d[50,2,0]:=813;d[50,2,1]:=447;d[50,2,2]:=758;d[50,3,0]:=837;d[50,3,1]:=607;d[50,3,2]:=973;
d[51,1,0]:=581;d[51,1,1]:=875;d[51,1,2]:=146;d[51,2,0]:=339;d[51,2,1]:=315;d[51,2,2]:=193;d[51,3,0]:=168;d[51,3,1]:=22;d[51,3,2]:=171;d[52,1,0]:=649;d[52,1,1]:=504;d[52,1,2]:=351;d[52,2,0]:=841;d[52,2,1]:=493;d[52,2,2]:=0;d[52,3,0]:=287;d[52,3,1]:=206;d[52,3,2]:=791;
d[53,1,0]:=224;d[53,1,1]:=661;d[53,1,2]:=667;d[53,2,0]:=482;d[53,2,1]:=706;d[53,2,2]:=812;d[53,3,0]:=800;d[53,3,1]:=903;d[53,3,2]:=679;d[54,1,0]:=517;d[54,1,1]:=719;d[54,1,2]:=945;d[54,2,0]:=681;d[54,2,1]:=14;d[54,2,2]:=733;d[54,3,0]:=303;d[54,3,1]:=355;d[54,3,2]:=378;
d[55,1,0]:=790;d[55,1,1]:=333;d[55,1,2]:=635;d[55,2,0]:=332;d[55,2,1]:=125;d[55,2,2]:=458;d[55,3,0]:=863;d[55,3,1]:=259;d[55,3,2]:=199;d[56,1,0]:=359;d[56,1,1]:=993;d[56,1,2]:=379;d[56,2,0]:=53;d[56,2,1]:=412;d[56,2,2]:=671;d[56,3,0]:=149;d[56,3,1]:=263;d[56,3,2]:=901;
d[57,1,0]:=805;d[57,1,1]:=767;d[57,1,2]:=916;d[57,2,0]:=315;d[57,2,1]:=626;d[57,2,2]:=396;d[57,3,0]:=988;d[57,3,1]:=72;d[57,3,2]:=324;d[58,1,0]:=981;d[58,1,1]:=280;d[58,1,2]:=977;d[58,2,0]:=434;d[58,2,1]:=418;d[58,2,2]:=698;d[58,3,0]:=541;d[58,3,1]:=874;d[58,3,2]:=821;
d[59,1,0]:=748;d[59,1,1]:=516;d[59,1,2]:=770;d[59,2,0]:=365;d[59,2,1]:=116;d[59,2,2]:=592;d[59,3,0]:=262;d[59,3,1]:=851;d[59,3,2]:=103;d[60,1,0]:=423;d[60,1,1]:=573;d[60,1,2]:=892;d[60,2,0]:=605;d[60,2,1]:=137;d[60,2,2]:=710;d[60,3,0]:=76;d[60,3,1]:=181;d[60,3,2]:=529;
d[61,1,0]:=200;d[61,1,1]:=607;d[61,1,2]:=380;d[61,2,0]:=941;d[61,2,1]:=144;d[61,2,2]:=751;d[61,3,0]:=859;d[61,3,1]:=282;d[61,3,2]:=469;d[62,1,0]:=20;d[62,1,1]:=520;d[62,1,2]:=884;d[62,2,0]:=767;d[62,2,1]:=787;d[62,2,2]:=880;d[62,3,0]:=76;d[62,3,1]:=711;d[62,3,2]:=691;
d[63,1,0]:=325;d[63,1,1]:=236;d[63,1,2]:=520;d[63,2,0]:=428;d[63,2,1]:=669;d[63,2,2]:=905;d[63,3,0]:=675;d[63,3,1]:=155;d[63,3,2]:=750;d[64,1,0]:=676;d[64,1,1]:=385;d[64,1,2]:=325;d[64,2,0]:=343;d[64,2,1]:=22;d[64,2,2]:=407;d[64,3,0]:=802;d[64,3,1]:=217;d[64,3,2]:=190;
d[65,1,0]:=70;d[65,1,1]:=555;d[65,1,2]:=724;d[65,2,0]:=754;d[65,2,1]:=824;d[65,2,2]:=30;d[65,3,0]:=247;d[65,3,1]:=577;d[65,3,2]:=507;d[66,1,0]:=739;d[66,1,1]:=662;d[66,1,2]:=57;d[66,2,0]:=329;d[66,2,1]:=607;d[66,2,2]:=272;d[66,3,0]:=853;d[66,3,1]:=796;d[66,3,2]:=473;
d[67,1,0]:=542;d[67,1,1]:=653;d[67,1,2]:=763;d[67,2,0]:=46;d[67,2,1]:=588;d[67,2,2]:=244;d[67,3,0]:=202;d[67,3,1]:=386;d[67,3,2]:=855;d[68,1,0]:=970;d[68,1,1]:=145;d[68,1,2]:=532;d[68,2,0]:=754;d[68,2,1]:=727;d[68,2,2]:=222;d[68,3,0]:=126;d[68,3,1]:=601;d[68,3,2]:=628;
d[69,1,0]:=344;d[69,1,1]:=487;d[69,1,2]:=509;d[69,2,0]:=107;d[69,2,1]:=108;d[69,2,2]:=595;d[69,3,0]:=952;d[69,3,1]:=443;d[69,3,2]:=152;d[70,1,0]:=53;d[70,1,1]:=837;d[70,1,2]:=421;d[70,2,0]:=624;d[70,2,1]:=677;d[70,2,2]:=517;d[70,3,0]:=506;d[70,3,1]:=171;d[70,3,2]:=346;
d[71,1,0]:=350;d[71,1,1]:=700;d[71,1,2]:=220;d[71,2,0]:=85;d[71,2,1]:=435;d[71,2,2]:=862;d[71,3,0]:=957;d[71,3,1]:=475;d[71,3,2]:=125;d[72,1,0]:=621;d[72,1,1]:=5;d[72,1,2]:=41;d[72,2,0]:=844;d[72,2,1]:=798;d[72,2,2]:=803;d[72,3,0]:=878;d[72,3,1]:=837;d[72,3,2]:=963;
d[73,1,0]:=261;d[73,1,1]:=973;d[73,1,2]:=796;d[73,2,0]:=944;d[73,2,1]:=208;d[73,2,2]:=184;d[73,3,0]:=65;d[73,3,1]:=143;d[73,3,2]:=41;d[74,1,0]:=886;d[74,1,1]:=166;d[74,1,2]:=836;d[74,2,0]:=225;d[74,2,1]:=114;d[74,2,2]:=386;d[74,3,0]:=985;d[74,3,1]:=126;d[74,3,2]:=237;
d[75,1,0]:=569;d[75,1,1]:=528;d[75,1,2]:=338;d[75,2,0]:=536;d[75,2,1]:=667;d[75,2,2]:=198;d[75,3,0]:=232;d[75,3,1]:=891;d[75,3,2]:=304;d[76,1,0]:=746;d[76,1,1]:=556;d[76,1,2]:=448;d[76,2,0]:=452;d[76,2,1]:=201;d[76,2,2]:=757;d[76,3,0]:=460;d[76,3,1]:=738;d[76,3,2]:=19;
d[77,1,0]:=473;d[77,1,1]:=237;d[77,1,2]:=545;d[77,2,0]:=775;d[77,2,1]:=251;d[77,2,2]:=230;d[77,3,0]:=660;d[77,3,1]:=588;d[77,3,2]:=115;d[78,1,0]:=483;d[78,1,1]:=632;d[78,1,2]:=349;d[78,2,0]:=335;d[78,2,1]:=351;d[78,2,2]:=983;d[78,3,0]:=805;d[78,3,1]:=456;d[78,3,2]:=527;
d[79,1,0]:=852;d[79,1,1]:=415;d[79,1,2]:=639;d[79,2,0]:=249;d[79,2,1]:=104;d[79,2,2]:=519;d[79,3,0]:=940;d[79,3,1]:=161;d[79,3,2]:=358;d[80,1,0]:=552;d[80,1,1]:=230;d[80,1,2]:=724;d[80,2,0]:=464;d[80,2,1]:=19;d[80,2,2]:=737;d[80,3,0]:=20;d[80,3,1]:=996;d[80,3,2]:=444;
d[81,1,0]:=389;d[81,1,1]:=842;d[81,1,2]:=756;d[81,2,0]:=114;d[81,2,1]:=510;d[81,2,2]:=355;d[81,3,0]:=39;d[81,3,1]:=280;d[81,3,2]:=75;d[82,1,0]:=536;d[82,1,1]:=928;d[82,1,2]:=237;d[82,2,0]:=221;d[82,2,1]:=757;d[82,2,2]:=688;d[82,3,0]:=507;d[82,3,1]:=250;d[82,3,2]:=438;
d[83,1,0]:=257;d[83,1,1]:=479;d[83,1,2]:=165;d[83,2,0]:=21;d[83,2,1]:=278;d[83,2,2]:=853;d[83,3,0]:=15;d[83,3,1]:=263;d[83,3,2]:=6;d[84,1,0]:=993;d[84,1,1]:=913;d[84,1,2]:=674;d[84,2,0]:=472;d[84,2,1]:=879;d[84,2,2]:=795;d[84,3,0]:=662;d[84,3,1]:=985;d[84,3,2]:=807;
d[85,1,0]:=595;d[85,1,1]:=983;d[85,1,2]:=190;d[85,2,0]:=455;d[85,2,1]:=53;d[85,2,2]:=39;d[85,3,0]:=550;d[85,3,1]:=500;d[85,3,2]:=536;d[86,1,0]:=995;d[86,1,1]:=586;d[86,1,2]:=66;d[86,2,0]:=595;d[86,2,1]:=593;d[86,2,2]:=529;d[86,3,0]:=329;d[86,3,1]:=264;d[86,3,2]:=266;
d[87,1,0]:=295;d[87,1,1]:=853;d[87,1,2]:=30;d[87,2,0]:=146;d[87,2,1]:=260;d[87,2,2]:=116;d[87,3,0]:=966;d[87,3,1]:=936;d[87,3,2]:=177;d[88,1,0]:=528;d[88,1,1]:=478;d[88,1,2]:=881;d[88,2,0]:=600;d[88,2,1]:=131;d[88,2,2]:=609;d[88,3,0]:=518;d[88,3,1]:=610;d[88,3,2]:=996;
d[89,1,0]:=557;d[89,1,1]:=83;d[89,1,2]:=443;d[89,2,0]:=913;d[89,2,1]:=473;d[89,2,2]:=470;d[89,3,0]:=248;d[89,3,1]:=225;d[89,3,2]:=665;d[90,1,0]:=464;d[90,1,1]:=1;d[90,1,2]:=315;d[90,2,0]:=491;d[90,2,1]:=175;d[90,2,2]:=176;d[90,3,0]:=695;d[90,3,1]:=380;d[90,3,2]:=793;
d[91,1,0]:=710;d[91,1,1]:=394;d[91,1,2]:=604;d[91,2,0]:=596;d[91,2,1]:=309;d[91,2,2]:=703;d[91,3,0]:=430;d[91,3,1]:=876;d[91,3,2]:=824;d[92,1,0]:=846;d[92,1,1]:=235;d[92,1,2]:=756;d[92,2,0]:=178;d[92,2,1]:=27;d[92,2,2]:=419;d[92,3,0]:=271;d[92,3,1]:=753;d[92,3,2]:=904;
d[93,1,0]:=833;d[93,1,1]:=588;d[93,1,2]:=972;d[93,2,0]:=150;d[93,2,1]:=584;d[93,2,2]:=175;d[93,3,0]:=230;d[93,3,1]:=255;d[93,3,2]:=917;d[94,1,0]:=382;d[94,1,1]:=644;d[94,1,2]:=450;d[94,2,0]:=575;d[94,2,1]:=957;d[94,2,2]:=604;d[94,3,0]:=456;d[94,3,1]:=501;d[94,3,2]:=103;
d[95,1,0]:=453;d[95,1,1]:=861;d[95,1,2]:=280;d[95,2,0]:=836;d[95,2,1]:=292;d[95,2,2]:=556;d[95,3,0]:=450;d[95,3,1]:=839;d[95,3,2]:=386;d[96,1,0]:=566;d[96,1,1]:=39;d[96,1,2]:=614;d[96,2,0]:=333;d[96,2,1]:=677;d[96,2,2]:=716;d[96,3,0]:=855;d[96,3,1]:=241;d[96,3,2]:=475;
d[97,1,0]:=864;d[97,1,1]:=383;d[97,1,2]:=39;d[97,2,0]:=546;d[97,2,1]:=413;d[97,2,2]:=796;d[97,3,0]:=453;d[97,3,1]:=957;d[97,3,2]:=836;d[98,1,0]:=110;d[98,1,1]:=492;d[98,1,2]:=403;d[98,2,0]:=335;d[98,2,1]:=445;d[98,2,2]:=929;d[98,3,0]:=306;d[98,3,1]:=139;d[98,3,2]:=29;
d[99,1,0]:=894;d[99,1,1]:=894;d[99,1,2]:=558;d[99,2,0]:=267;d[99,2,1]:=809;d[99,2,2]:=706;d[99,3,0]:=243;d[99,3,1]:=682;d[99,3,2]:=24;d[100,1,0]:=562;d[100,1,1]:=255;d[100,1,2]:=452;d[100,2,0]:=222;d[100,2,1]:=784;d[100,2,2]:=42;d[100,3,0]:=723;d[100,3,1]:=61;d[100,3,2]:=978;
d[101,1,0]:=562;d[101,1,1]:=295;d[101,1,2]:=462;d[101,2,0]:=707;d[101,2,1]:=272;d[101,2,2]:=245;d[101,3,0]:=848;d[101,3,1]:=421;d[101,3,2]:=856;d[102,1,0]:=128;d[102,1,1]:=843;d[102,1,2]:=51;d[102,2,0]:=412;d[102,2,1]:=515;d[102,2,2]:=361;d[102,3,0]:=903;d[102,3,1]:=852;d[102,3,2]:=506;
d[103,1,0]:=922;d[103,1,1]:=938;d[103,1,2]:=967;d[103,2,0]:=712;d[103,2,1]:=637;d[103,2,2]:=578;d[103,3,0]:=810;d[103,3,1]:=824;d[103,3,2]:=751;d[104,1,0]:=252;d[104,1,1]:=478;d[104,1,2]:=987;d[104,2,0]:=402;d[104,2,1]:=654;d[104,2,2]:=412;d[104,3,0]:=429;d[104,3,1]:=225;d[104,3,2]:=970;
d[105,1,0]:=661;d[105,1,1]:=856;d[105,1,2]:=39;d[105,2,0]:=912;d[105,2,1]:=17;d[105,2,2]:=873;d[105,3,0]:=898;d[105,3,1]:=859;d[105,3,2]:=14;d[106,1,0]:=952;d[106,1,1]:=406;d[106,1,2]:=222;d[106,2,0]:=827;d[106,2,1]:=782;d[106,2,2]:=191;d[106,3,0]:=491;d[106,3,1]:=291;d[106,3,2]:=897;
d[107,1,0]:=390;d[107,1,1]:=289;d[107,1,2]:=151;d[107,2,0]:=524;d[107,2,1]:=914;d[107,2,2]:=373;d[107,3,0]:=694;d[107,3,1]:=220;d[107,3,2]:=827;d[108,1,0]:=516;d[108,1,1]:=756;d[108,1,2]:=356;d[108,2,0]:=53;d[108,2,1]:=935;d[108,2,2]:=694;d[108,3,0]:=43;d[108,3,1]:=684;d[108,3,2]:=10;
d[109,1,0]:=634;d[109,1,1]:=146;d[109,1,2]:=262;d[109,2,0]:=354;d[109,2,1]:=988;d[109,2,2]:=137;d[109,3,0]:=491;d[109,3,1]:=497;d[109,3,2]:=637;d[110,1,0]:=681;d[110,1,1]:=453;d[110,1,2]:=835;d[110,2,0]:=770;d[110,2,1]:=454;d[110,2,2]:=932;d[110,3,0]:=388;d[110,3,1]:=66;d[110,3,2]:=382;
d[111,1,0]:=88;d[111,1,1]:=117;d[111,1,2]:=731;d[111,2,0]:=217;d[111,2,1]:=366;d[111,2,2]:=483;d[111,3,0]:=946;d[111,3,1]:=215;d[111,3,2]:=268;d[112,1,0]:=487;d[112,1,1]:=789;d[112,1,2]:=438;d[112,2,0]:=328;d[112,2,1]:=815;d[112,2,2]:=607;d[112,3,0]:=292;d[112,3,1]:=523;d[112,3,2]:=84;
d[113,1,0]:=21;d[113,1,1]:=989;d[113,1,2]:=989;d[113,2,0]:=898;d[113,2,1]:=919;d[113,2,2]:=906;d[113,3,0]:=177;d[113,3,1]:=742;d[113,3,2]:=721;d[114,1,0]:=973;d[114,1,1]:=705;d[114,1,2]:=986;d[114,2,0]:=96;d[114,2,1]:=399;d[114,2,2]:=107;d[114,3,0]:=31;d[114,3,1]:=42;d[114,3,2]:=65;
d[115,1,0]:=92;d[115,1,1]:=431;d[115,1,2]:=781;d[115,2,0]:=681;d[115,2,1]:=773;d[115,2,2]:=207;d[115,3,0]:=67;d[115,3,1]:=706;d[115,3,2]:=498;d[116,1,0]:=143;d[116,1,1]:=619;d[116,1,2]:=128;d[116,2,0]:=427;d[116,2,1]:=570;d[116,2,2]:=299;d[116,3,0]:=491;d[116,3,1]:=79;d[116,3,2]:=933;
d[117,1,0]:=591;d[117,1,1]:=338;d[117,1,2]:=358;d[117,2,0]:=218;d[117,2,1]:=519;d[117,2,2]:=857;d[117,3,0]:=43;d[117,3,1]:=682;d[117,3,2]:=175;d[118,1,0]:=613;d[118,1,1]:=456;d[118,1,2]:=467;d[118,2,0]:=522;d[118,2,1]:=138;d[118,2,2]:=594;d[118,3,0]:=19;d[118,3,1]:=119;d[118,3,2]:=475;
d[119,1,0]:=862;d[119,1,1]:=814;d[119,1,2]:=334;d[119,2,0]:=524;d[119,2,1]:=389;d[119,2,2]:=190;d[119,3,0]:=564;d[119,3,1]:=822;d[119,3,2]:=957;d[120,1,0]:=254;d[120,1,1]:=151;d[120,1,2]:=152;d[120,2,0]:=70;d[120,2,1]:=764;d[120,2,2]:=915;d[120,3,0]:=952;d[120,3,1]:=800;d[120,3,2]:=115;
d[121,1,0]:=685;d[121,1,1]:=508;d[121,1,2]:=119;d[121,2,0]:=847;d[121,2,1]:=535;d[121,2,2]:=46;d[121,3,0]:=685;d[121,3,1]:=847;d[121,3,2]:=196;d[122,1,0]:=679;d[122,1,1]:=174;d[122,1,2]:=139;d[122,2,0]:=234;d[122,2,1]:=913;d[122,2,2]:=95;d[122,3,0]:=882;d[122,3,1]:=31;d[122,3,2]:=349;
d[123,1,0]:=958;d[123,1,1]:=918;d[123,1,2]:=524;d[123,2,0]:=377;d[123,2,1]:=929;d[123,2,2]:=850;d[123,3,0]:=567;d[123,3,1]:=43;d[123,3,2]:=807;d[124,1,0]:=38;d[124,1,1]:=925;d[124,1,2]:=913;d[124,2,0]:=124;d[124,2,1]:=162;d[124,2,2]:=90;d[124,3,0]:=536;d[124,3,1]:=623;d[124,3,2]:=464;
d[125,1,0]:=373;d[125,1,1]:=179;d[125,1,2]:=727;d[125,2,0]:=5;d[125,2,1]:=378;d[125,2,2]:=275;d[125,3,0]:=66;d[125,3,1]:=312;d[125,3,2]:=936;d[126,1,0]:=813;d[126,1,1]:=345;d[126,1,2]:=979;d[126,2,0]:=354;d[126,2,1]:=27;d[126,2,2]:=372;d[126,3,0]:=612;d[126,3,1]:=630;d[126,3,2]:=739;
d[127,1,0]:=680;d[127,1,1]:=193;d[127,1,2]:=61;d[127,2,0]:=106;d[127,2,1]:=786;d[127,2,2]:=979;d[127,3,0]:=179;d[127,3,1]:=607;d[127,3,2]:=372;d[128,1,0]:=417;d[128,1,1]:=347;d[128,1,2]:=362;d[128,2,0]:=211;d[128,2,1]:=628;d[128,2,2]:=846;d[128,3,0]:=143;d[128,3,1]:=485;d[128,3,2]:=68;
d[129,1,0]:=422;d[129,1,1]:=799;d[129,1,2]:=420;d[129,2,0]:=770;d[129,2,1]:=548;d[129,2,2]:=350;d[129,3,0]:=273;d[129,3,1]:=850;d[129,3,2]:=497;d[130,1,0]:=136;d[130,1,1]:=682;d[130,1,2]:=28;d[130,2,0]:=152;d[130,2,1]:=288;d[130,2,2]:=970;d[130,3,0]:=657;d[130,3,1]:=628;d[130,3,2]:=342;
d[131,1,0]:=758;d[131,1,1]:=49;d[131,1,2]:=111;d[131,2,0]:=264;d[131,2,1]:=25;d[131,2,2]:=153;d[131,3,0]:=646;d[131,3,1]:=376;d[131,3,2]:=615;d[132,1,0]:=356;d[132,1,1]:=159;d[132,1,2]:=933;d[132,2,0]:=116;d[132,2,1]:=21;d[132,2,2]:=180;d[132,3,0]:=215;d[132,3,1]:=279;d[132,3,2]:=898;
d[133,1,0]:=453;d[133,1,1]:=156;d[133,1,2]:=557;d[133,2,0]:=484;d[133,2,1]:=937;d[133,2,2]:=96;d[133,3,0]:=869;d[133,3,1]:=68;d[133,3,2]:=28;d[134,1,0]:=764;d[134,1,1]:=710;d[134,1,2]:=279;d[134,2,0]:=468;d[134,2,1]:=235;d[134,2,2]:=189;d[134,3,0]:=725;d[134,3,1]:=507;d[134,3,2]:=740;
d[135,1,0]:=310;d[135,1,1]:=917;d[135,1,2]:=29;d[135,2,0]:=387;d[135,2,1]:=438;d[135,2,2]:=358;d[135,3,0]:=742;d[135,3,1]:=713;d[135,3,2]:=642;d[136,1,0]:=553;d[136,1,1]:=599;d[136,1,2]:=269;d[136,2,0]:=158;d[136,2,1]:=711;d[136,2,2]:=313;d[136,3,0]:=25;d[136,3,1]:=686;d[136,3,2]:=624;
d[137,1,0]:=184;d[137,1,1]:=374;d[137,1,2]:=289;d[137,2,0]:=28;d[137,2,1]:=212;d[137,2,2]:=736;d[137,3,0]:=842;d[137,3,1]:=367;d[137,3,2]:=183;d[138,1,0]:=722;d[138,1,1]:=934;d[138,1,2]:=641;d[138,2,0]:=572;d[138,2,1]:=991;d[138,2,2]:=928;d[138,3,0]:=290;d[138,3,1]:=646;d[138,3,2]:=282;
d[139,1,0]:=160;d[139,1,1]:=590;d[139,1,2]:=996;d[139,2,0]:=714;d[139,2,1]:=874;d[139,2,2]:=467;d[139,3,0]:=382;d[139,3,1]:=492;d[139,3,2]:=972;d[140,1,0]:=186;d[140,1,1]:=43;d[140,1,2]:=46;d[140,2,0]:=399;d[140,2,1]:=585;d[140,2,2]:=353;d[140,3,0]:=10;d[140,3,1]:=575;d[140,3,2]:=389;
d[141,1,0]:=544;d[141,1,1]:=541;d[141,1,2]:=199;d[141,2,0]:=815;d[141,2,1]:=75;d[141,2,2]:=616;d[141,3,0]:=249;d[141,3,1]:=50;d[141,3,2]:=566;d[142,1,0]:=184;d[142,1,1]:=69;d[142,1,2]:=838;d[142,2,0]:=725;d[142,2,1]:=909;d[142,2,2]:=978;d[142,3,0]:=148;d[142,3,1]:=761;d[142,3,2]:=217;
d[143,1,0]:=473;d[143,1,1]:=558;d[143,1,2]:=719;d[143,2,0]:=226;d[143,2,1]:=699;d[143,2,2]:=504;d[143,3,0]:=908;d[143,3,1]:=788;d[143,3,2]:=315;d[144,1,0]:=807;d[144,1,1]:=46;d[144,1,2]:=798;d[144,2,0]:=492;d[144,2,1]:=645;d[144,2,2]:=691;d[144,3,0]:=914;d[144,3,1]:=116;d[144,3,2]:=575;
d[145,1,0]:=67;d[145,1,1]:=658;d[145,1,2]:=571;d[145,2,0]:=76;d[145,2,1]:=143;d[145,2,2]:=801;d[145,3,0]:=583;d[145,3,1]:=557;d[145,3,2]:=244;d[146,1,0]:=532;d[146,1,1]:=212;d[146,1,2]:=439;d[146,2,0]:=370;d[146,2,1]:=902;d[146,2,2]:=928;d[146,3,0]:=495;d[146,3,1]:=407;d[146,3,2]:=872;
d[147,1,0]:=742;d[147,1,1]:=136;d[147,1,2]:=800;d[147,2,0]:=432;d[147,2,1]:=493;d[147,2,2]:=629;d[147,3,0]:=887;d[147,3,1]:=87;d[147,3,2]:=542;d[148,1,0]:=393;d[148,1,1]:=527;d[148,1,2]:=135;d[148,2,0]:=117;d[148,2,1]:=510;d[148,2,2]:=40;d[148,3,0]:=321;d[148,3,1]:=189;d[148,3,2]:=848;
d[149,1,0]:=466;d[149,1,1]:=343;d[149,1,2]:=615;d[149,2,0]:=810;d[149,2,1]:=279;d[149,2,2]:=195;d[149,3,0]:=633;d[149,3,1]:=643;d[149,3,2]:=177;d[150,1,0]:=323;d[150,1,1]:=816;d[150,1,2]:=215;d[150,2,0]:=785;d[150,2,1]:=751;d[150,2,2]:=570;d[150,3,0]:=639;d[150,3,1]:=424;d[150,3,2]:=146;
d[151,1,0]:=521;d[151,1,1]:=334;d[151,1,2]:=565;d[151,2,0]:=77;d[151,2,1]:=598;d[151,2,2]:=932;d[151,3,0]:=90;d[151,3,1]:=508;d[151,3,2]:=424;d[152,1,0]:=655;d[152,1,1]:=564;d[152,1,2]:=819;d[152,2,0]:=848;d[152,2,1]:=506;d[152,2,2]:=29;d[152,3,0]:=385;d[152,3,1]:=121;d[152,3,2]:=463;
d[153,1,0]:=183;d[153,1,1]:=663;d[153,1,2]:=57;d[153,2,0]:=943;d[153,2,1]:=223;d[153,2,2]:=886;d[153,3,0]:=261;d[153,3,1]:=204;d[153,3,2]:=682;d[154,1,0]:=360;d[154,1,1]:=594;d[154,1,2]:=814;d[154,2,0]:=32;d[154,2,1]:=392;d[154,2,2]:=986;d[154,3,0]:=319;d[154,3,1]:=73;d[154,3,2]:=913;
d[155,1,0]:=421;d[155,1,1]:=694;d[155,1,2]:=747;d[155,2,0]:=823;d[155,2,1]:=247;d[155,2,2]:=76;d[155,3,0]:=871;d[155,3,1]:=373;d[155,3,2]:=949;d[156,1,0]:=821;d[156,1,1]:=312;d[156,1,2]:=443;d[156,2,0]:=820;d[156,2,1]:=65;d[156,2,2]:=377;d[156,3,0]:=511;d[156,3,1]:=68;d[156,3,2]:=309;
d[157,1,0]:=465;d[157,1,1]:=46;d[157,1,2]:=770;d[157,2,0]:=983;d[157,2,1]:=451;d[157,2,2]:=497;d[157,3,0]:=97;d[157,3,1]:=354;d[157,3,2]:=143;d[158,1,0]:=509;d[158,1,1]:=184;d[158,1,2]:=784;d[158,2,0]:=917;d[158,2,1]:=429;d[158,2,2]:=133;d[158,3,0]:=48;d[158,3,1]:=381;d[158,3,2]:=869;
d[159,1,0]:=831;d[159,1,1]:=121;d[159,1,2]:=115;d[159,2,0]:=275;d[159,2,1]:=39;d[159,2,2]:=160;d[159,3,0]:=0;d[159,3,1]:=882;d[159,3,2]:=275;d[160,1,0]:=391;d[160,1,1]:=762;d[160,1,2]:=804;d[160,2,0]:=264;d[160,2,1]:=655;d[160,2,2]:=420;d[160,3,0]:=320;d[160,3,1]:=335;d[160,3,2]:=85;
d[161,1,0]:=656;d[161,1,1]:=117;d[161,1,2]:=638;d[161,2,0]:=333;d[161,2,1]:=989;d[161,2,2]:=692;d[161,3,0]:=151;d[161,3,1]:=838;d[161,3,2]:=182;d[162,1,0]:=269;d[162,1,1]:=438;d[162,1,2]:=615;d[162,2,0]:=910;d[162,2,1]:=854;d[162,2,2]:=295;d[162,3,0]:=290;d[162,3,1]:=672;d[162,3,2]:=620;
d[163,1,0]:=628;d[163,1,1]:=546;d[163,1,2]:=424;d[163,2,0]:=9;d[163,2,1]:=637;d[163,2,2]:=186;d[163,3,0]:=667;d[163,3,1]:=967;d[163,3,2]:=216;d[164,1,0]:=229;d[164,1,1]:=757;d[164,1,2]:=990;d[164,2,0]:=401;d[164,2,1]:=630;d[164,2,2]:=408;d[164,3,0]:=730;d[164,3,1]:=897;d[164,3,2]:=668;
d[165,1,0]:=59;d[165,1,1]:=620;d[165,1,2]:=748;d[165,2,0]:=919;d[165,2,1]:=548;d[165,2,2]:=171;d[165,3,0]:=576;d[165,3,1]:=825;d[165,3,2]:=343;d[166,1,0]:=699;d[166,1,1]:=762;d[166,1,2]:=15;d[166,2,0]:=989;d[166,2,1]:=691;d[166,2,2]:=456;d[166,3,0]:=528;d[166,3,1]:=163;d[166,3,2]:=293;
d[167,1,0]:=213;d[167,1,1]:=808;d[167,1,2]:=396;d[167,2,0]:=551;d[167,2,1]:=764;d[167,2,2]:=155;d[167,3,0]:=94;d[167,3,1]:=670;d[167,3,2]:=457;d[168,1,0]:=338;d[168,1,1]:=924;d[168,1,2]:=375;d[168,2,0]:=77;d[168,2,1]:=772;d[168,2,2]:=699;d[168,3,0]:=442;d[168,3,1]:=67;d[168,3,2]:=632;
d[169,1,0]:=23;d[169,1,1]:=655;d[169,1,2]:=313;d[169,2,0]:=137;d[169,2,1]:=160;d[169,2,2]:=815;d[169,3,0]:=845;d[169,3,1]:=312;d[169,3,2]:=503;d[170,1,0]:=755;d[170,1,1]:=368;d[170,1,2]:=84;d[170,2,0]:=536;d[170,2,1]:=294;d[170,2,2]:=452;d[170,3,0]:=451;d[170,3,1]:=840;d[170,3,2]:=85;
d[171,1,0]:=21;d[171,1,1]:=410;d[171,1,2]:=515;d[171,2,0]:=306;d[171,2,1]:=378;d[171,2,2]:=788;d[171,3,0]:=792;d[171,3,1]:=277;d[171,3,2]:=511;d[172,1,0]:=89;d[172,1,1]:=379;d[172,1,2]:=319;d[172,2,0]:=958;d[172,2,1]:=50;d[172,2,2]:=429;d[172,3,0]:=299;d[172,3,1]:=748;d[172,3,2]:=678;
d[173,1,0]:=649;d[173,1,1]:=206;d[173,1,2]:=993;d[173,2,0]:=985;d[173,2,1]:=637;d[173,2,2]:=989;d[173,3,0]:=582;d[173,3,1]:=55;d[173,3,2]:=403;d[174,1,0]:=336;d[174,1,1]:=847;d[174,1,2]:=184;d[174,2,0]:=478;d[174,2,1]:=444;d[174,2,2]:=294;d[174,3,0]:=764;d[174,3,1]:=580;d[174,3,2]:=711;
d[175,1,0]:=207;d[175,1,1]:=682;d[175,1,2]:=747;d[175,2,0]:=778;d[175,2,1]:=985;d[175,2,2]:=670;d[175,3,0]:=106;d[175,3,1]:=879;d[175,3,2]:=788;d[176,1,0]:=883;d[176,1,1]:=880;d[176,1,2]:=569;d[176,2,0]:=966;d[176,2,1]:=852;d[176,2,2]:=397;d[176,3,0]:=487;d[176,3,1]:=365;d[176,3,2]:=479;
d[177,1,0]:=745;d[177,1,1]:=820;d[177,1,2]:=585;d[177,2,0]:=965;d[177,2,1]:=557;d[177,2,2]:=380;d[177,3,0]:=391;d[177,3,1]:=803;d[177,3,2]:=574;d[178,1,0]:=420;d[178,1,1]:=543;d[178,1,2]:=362;d[178,2,0]:=22;d[178,2,1]:=442;d[178,2,2]:=985;d[178,3,0]:=930;d[178,3,1]:=509;d[178,3,2]:=476;
d[179,1,0]:=264;d[179,1,1]:=594;d[179,1,2]:=485;d[179,2,0]:=315;d[179,2,1]:=579;d[179,2,2]:=827;d[179,3,0]:=212;d[179,3,1]:=367;d[179,3,2]:=103;d[180,1,0]:=299;d[180,1,1]:=238;d[180,1,2]:=307;d[180,2,0]:=208;d[180,2,1]:=660;d[180,2,2]:=898;d[180,3,0]:=256;d[180,3,1]:=946;d[180,3,2]:=949;
d[181,1,0]:=938;d[181,1,1]:=706;d[181,1,2]:=167;d[181,2,0]:=673;d[181,2,1]:=614;d[181,2,2]:=323;d[181,3,0]:=328;d[181,3,1]:=286;d[181,3,2]:=37;d[182,1,0]:=842;d[182,1,1]:=711;d[182,1,2]:=995;d[182,2,0]:=480;d[182,2,1]:=325;d[182,2,2]:=482;d[182,3,0]:=905;d[182,3,1]:=417;d[182,3,2]:=572;
d[183,1,0]:=219;d[183,1,1]:=37;d[183,1,2]:=564;d[183,2,0]:=779;d[183,2,1]:=178;d[183,2,2]:=215;d[183,3,0]:=594;d[183,3,1]:=30;d[183,3,2]:=185;d[184,1,0]:=21;d[184,1,1]:=945;d[184,1,2]:=100;d[184,2,0]:=317;d[184,2,1]:=338;d[184,2,2]:=286;d[184,3,0]:=883;d[184,3,1]:=452;d[184,3,2]:=831;
d[185,1,0]:=421;d[185,1,1]:=220;d[185,1,2]:=606;d[185,2,0]:=991;d[185,2,1]:=415;d[185,2,2]:=385;d[185,3,0]:=202;d[185,3,1]:=213;d[185,3,2]:=789;d[186,1,0]:=217;d[186,1,1]:=484;d[186,1,2]:=109;d[186,2,0]:=514;d[186,2,1]:=918;d[186,2,2]:=405;d[186,3,0]:=703;d[186,3,1]:=594;d[186,3,2]:=808;
d[187,1,0]:=529;d[187,1,1]:=437;d[187,1,2]:=135;d[187,2,0]:=600;d[187,2,1]:=132;d[187,2,2]:=569;d[187,3,0]:=230;d[187,3,1]:=899;d[187,3,2]:=667;d[188,1,0]:=854;d[188,1,1]:=317;d[188,1,2]:=872;d[188,2,0]:=18;d[188,2,1]:=872;d[188,2,2]:=143;d[188,3,0]:=549;d[188,3,1]:=323;d[188,3,2]:=466;
d[189,1,0]:=826;d[189,1,1]:=483;d[189,1,2]:=708;d[189,2,0]:=814;d[189,2,1]:=620;d[189,2,2]:=106;d[189,3,0]:=394;d[189,3,1]:=683;d[189,3,2]:=420;d[190,1,0]:=14;d[190,1,1]:=30;d[190,1,2]:=566;d[190,2,0]:=184;d[190,2,1]:=198;d[190,2,2]:=228;d[190,3,0]:=72;d[190,3,1]:=126;d[190,3,2]:=102;
d[191,1,0]:=865;d[191,1,1]:=723;d[191,1,2]:=384;d[191,2,0]:=705;d[191,2,1]:=573;d[191,2,2]:=321;d[191,3,0]:=58;d[191,3,1]:=515;d[191,3,2]:=647;d[192,1,0]:=423;d[192,1,1]:=611;d[192,1,2]:=45;d[192,2,0]:=586;d[192,2,1]:=927;d[192,2,2]:=541;d[192,3,0]:=904;d[192,3,1]:=859;d[192,3,2]:=679;
d[193,1,0]:=306;d[193,1,1]:=925;d[193,1,2]:=613;d[193,2,0]:=142;d[193,2,1]:=448;d[193,2,2]:=376;d[193,3,0]:=965;d[193,3,1]:=480;d[193,3,2]:=893;d[194,1,0]:=647;d[194,1,1]:=304;d[194,1,2]:=467;d[194,2,0]:=936;d[194,2,1]:=586;d[194,2,2]:=469;d[194,3,0]:=309;d[194,3,1]:=277;d[194,3,2]:=627;
d[195,1,0]:=350;d[195,1,1]:=936;d[195,1,2]:=462;d[195,2,0]:=721;d[195,2,1]:=320;d[195,2,2]:=259;d[195,3,0]:=293;d[195,3,1]:=828;d[195,3,2]:=428;d[196,1,0]:=918;d[196,1,1]:=355;d[196,1,2]:=466;d[196,2,0]:=439;d[196,2,1]:=360;d[196,2,2]:=715;d[196,3,0]:=890;d[196,3,1]:=467;d[196,3,2]:=248;
d[197,1,0]:=892;d[197,1,1]:=325;d[197,1,2]:=576;d[197,2,0]:=303;d[197,2,1]:=198;d[197,2,2]:=724;d[197,3,0]:=245;d[197,3,1]:=950;d[197,3,2]:=58;d[198,1,0]:=751;d[198,1,1]:=912;d[198,1,2]:=111;d[198,2,0]:=318;d[198,2,1]:=292;d[198,2,2]:=207;d[198,3,0]:=7;d[198,3,1]:=893;d[198,3,2]:=311;
d[199,1,0]:=35;d[199,1,1]:=382;d[199,1,2]:=354;d[199,2,0]:=650;d[199,2,1]:=685;d[199,2,2]:=70;d[199,3,0]:=124;d[199,3,1]:=561;d[199,3,2]:=506;d[200,1,0]:=474;d[200,1,1]:=770;d[200,1,2]:=60;d[200,2,0]:=368;d[200,2,1]:=842;d[200,2,2]:=308;d[200,3,0]:=497;d[200,3,1]:=345;d[200,3,2]:=868;
assign(input,'bag.in');
reset(input);
readln(n);
close(input);
if n div 5000000=0
   then begin
        f[1,1]:=1;
        f[1,2]:=5;
        f[2,1]:=1;
        f[2,2]:=2;
        f[3,1]:=1;
        f[3,2]:=1;
        j:=2;
        k:=1;
        l:=3;
        end
   else begin
        for i:=1 to 3 do
            for j:=0 to 2 do
                f[i,j]:=d[n div 5000000,i,j];
        j:=((n div 5000000)*5000000-1) mod 3;
        k:=((n div 5000000)*5000000-2) mod 3;
        l:=(n div 5000000)*5000000;
        end;
for i:=l to n do
    begin
    f[3,i mod 3]:=(f[1,j]+f[3,k]) mod 997;
    f[2,i mod 3]:=(f[1,j]+f[2,j]) mod 997;
    f[1,i mod 3]:=(f[1,k]+f[2,j]+f[2,i mod 3]+f[3,j]) mod 997;
    j:=(j+1) mod 3;
    k:=(k+1) mod 3
    end;
assign(output,'bag.out');
rewrite(output);
if n<3
   then writeln(f[1,n])
   else writeln(f[1,n mod 3]);
close(output);
end.
