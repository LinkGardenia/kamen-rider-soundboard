import '../models/tv_series.dart';
import '../models/rider.dart';
import '../models/rider_form.dart';
import '../models/sound_effect.dart';
import '../utils/constants.dart';

class SoundRepository {
  SoundRepository._();

  static List<SoundEffect> _baseSounds(String riderId, String seriesId, {String? formId}) {
    final fid = formId ?? '';
    return [
      SoundEffect(id: '${riderId}_henshin$fid', name: '变身！', riderId: riderId, formId: formId,
        category: SoundCategory.henshin, assetPath: 'assets/sounds/$seriesId/$riderId/henshin.mp3'),
      SoundEffect(id: '${riderId}_hissatsu$fid', name: '必杀技', riderId: riderId, formId: formId,
        category: SoundCategory.hissatsu, assetPath: 'assets/sounds/$seriesId/$riderId/hissatsu.mp3'),
      SoundEffect(id: '${riderId}_belt$fid', name: '腰带音效', riderId: riderId, formId: formId,
        category: SoundCategory.belt, assetPath: 'assets/sounds/$seriesId/$riderId/belt.mp3'),
      SoundEffect(id: '${riderId}_weapon$fid', name: '武器音效', riderId: riderId, formId: formId,
        category: SoundCategory.weapon, assetPath: 'assets/sounds/$seriesId/$riderId/weapon.mp3'),
      SoundEffect(id: '${riderId}_lines$fid', name: '经典台词', riderId: riderId, formId: formId,
        category: SoundCategory.lines, assetPath: 'assets/sounds/$seriesId/$riderId/lines.mp3'),
    ];
  }

  static final kuuga = TVSeries(id: 'kuuga', title: '假面骑士空我', yearRange: '2000-2001', era: '平成',
    coverImagePath: 'assets/images/series/kuuga_cover.png', logoPath: 'assets/images/series/kuuga_logo.png',
    themeColorHex: '#CC0000', riders: [
      KamenRider(id: 'kuuga', name: '假面骑士空我', seriesId: 'kuuga',
        imagePath: 'assets/images/riders/kuuga.png', symbolPath: 'assets/images/symbols/kuuga.png',
        colorHex: '#CC0000', forms: [
          RiderForm(id: 'kuuga_mighty', name: '全能形态', riderId: 'kuuga', imagePath: 'assets/images/riders/kuuga_mighty.png'),
          RiderForm(id: 'kuuga_dragon', name: '青龙形态', riderId: 'kuuga', imagePath: 'assets/images/riders/kuuga_dragon.png'),
          RiderForm(id: 'kuuga_pegasus', name: '天马形态', riderId: 'kuuga', imagePath: 'assets/images/riders/kuuga_pegasus.png'),
          RiderForm(id: 'kuuga_titan', name: '泰坦形态', riderId: 'kuuga', imagePath: 'assets/images/riders/kuuga_titan.png'),
          RiderForm(id: 'kuuga_ultimate', name: '究极形态', riderId: 'kuuga', imagePath: 'assets/images/riders/kuuga_ultimate.png'),
        ]),
    ]);

  static final ryuki = TVSeries(id: 'ryuki', title: '假面骑士龙骑', yearRange: '2002-2003', era: '平成',
    coverImagePath: 'assets/images/series/ryuki_cover.png', logoPath: 'assets/images/series/ryuki_logo.png',
    themeColorHex: '#FF0000', riders: [
      KamenRider(id: 'ryuki', name: '假面骑士龙骑', seriesId: 'ryuki',
        imagePath: 'assets/images/riders/ryuki.png', symbolPath: 'assets/images/symbols/ryuki.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'ryuki_normal', name: '通常形态', riderId: 'ryuki', imagePath: 'assets/images/riders/ryuki.png'),
          RiderForm(id: 'ryuki_survive', name: '烈火生存', riderId: 'ryuki', imagePath: 'assets/images/riders/ryuki_survive.png'),
        ]),
      KamenRider(id: 'knight', name: '假面骑士夜骑', seriesId: 'ryuki',
        imagePath: 'assets/images/riders/knight.png', symbolPath: 'assets/images/symbols/knight.png', colorHex: '#000080',
        forms: [
          RiderForm(id: 'knight_normal', name: '通常形态', riderId: 'knight', imagePath: 'assets/images/riders/knight.png'),
          RiderForm(id: 'knight_survive', name: '疾风生存', riderId: 'knight', imagePath: 'assets/images/riders/knight_survive.png'),
        ]),
      KamenRider(id: 'zolda', name: '假面骑士铁兵', seriesId: 'ryuki',
        imagePath: 'assets/images/riders/zolda.png', symbolPath: 'assets/images/symbols/zolda.png', colorHex: '#008000',
        forms: [RiderForm(id: 'zolda_normal', name: '通常形态', riderId: 'zolda', imagePath: 'assets/images/riders/zolda.png')]),
      KamenRider(id: 'ouja', name: '假面骑士王蛇', seriesId: 'ryuki',
        imagePath: 'assets/images/riders/ouja.png', symbolPath: 'assets/images/symbols/ouja.png', colorHex: '#800080',
        forms: [RiderForm(id: 'ouja_normal', name: '通常形态', riderId: 'ouja', imagePath: 'assets/images/riders/ouja.png')]),
    ]);

  static final faiz = TVSeries(id: 'faiz', title: '假面骑士555', yearRange: '2003-2004', era: '平成',
    coverImagePath: 'assets/images/series/faiz_cover.png', logoPath: 'assets/images/series/faiz_logo.png',
    themeColorHex: '#FFFF00', riders: [
      KamenRider(id: 'faiz', name: '假面骑士Faiz', seriesId: 'faiz',
        imagePath: 'assets/images/riders/faiz.png', symbolPath: 'assets/images/symbols/faiz.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'faiz_normal', name: '通常形态', riderId: 'faiz', imagePath: 'assets/images/riders/faiz.png'),
          RiderForm(id: 'faiz_accel', name: '加速形态', riderId: 'faiz', imagePath: 'assets/images/riders/faiz_accel.png'),
          RiderForm(id: 'faiz_blaster', name: '爆裂形态', riderId: 'faiz', imagePath: 'assets/images/riders/faiz_blaster.png'),
        ]),
    ]);

  static final blade = TVSeries(id: 'blade', title: '假面骑士剑', yearRange: '2004-2005', era: '平成',
    coverImagePath: 'assets/images/series/blade_cover.png', logoPath: 'assets/images/series/blade_logo.png',
    themeColorHex: '#0000CD', riders: [
      KamenRider(id: 'blade', name: '假面骑士Blade', seriesId: 'blade',
        imagePath: 'assets/images/riders/blade.png', symbolPath: 'assets/images/symbols/blade.png', colorHex: '#4169E1',
        forms: [
          RiderForm(id: 'blade_normal', name: '通常形态', riderId: 'blade', imagePath: 'assets/images/riders/blade.png'),
          RiderForm(id: 'blade_jack', name: 'Jack Form', riderId: 'blade', imagePath: 'assets/images/riders/blade_jack.png'),
          RiderForm(id: 'blade_king', name: 'King Form', riderId: 'blade', imagePath: 'assets/images/riders/blade_king.png'),
        ]),
    ]);

  static final deno = TVSeries(id: 'deno', title: '假面骑士电王', yearRange: '2007-2008', era: '平成',
    coverImagePath: 'assets/images/series/deno_cover.png', logoPath: 'assets/images/series/deno_logo.png',
    themeColorHex: '#FF4500', riders: [
      KamenRider(id: 'deno', name: '假面骑士电王', seriesId: 'deno',
        imagePath: 'assets/images/riders/deno.png', symbolPath: 'assets/images/symbols/deno.png', colorHex: '#FF4500',
        forms: [
          RiderForm(id: 'deno_sword', name: '圣剑形态', riderId: 'deno', imagePath: 'assets/images/riders/deno_sword.png'),
          RiderForm(id: 'deno_rod', name: '圣竿形态', riderId: 'deno', imagePath: 'assets/images/riders/deno_rod.png'),
          RiderForm(id: 'deno_axe', name: '圣斧形态', riderId: 'deno', imagePath: 'assets/images/riders/deno_axe.png'),
          RiderForm(id: 'deno_gun', name: '圣枪形态', riderId: 'deno', imagePath: 'assets/images/riders/deno_gun.png'),
        ]),
    ]);

  static final decade = TVSeries(id: 'decade', title: '假面骑士Decade', yearRange: '2009', era: '平成',
    coverImagePath: 'assets/images/series/decade_cover.png', logoPath: 'assets/images/series/decade_logo.png',
    themeColorHex: '#FF00FF', riders: [
      KamenRider(id: 'decade', name: '假面骑士Decade', seriesId: 'decade',
        imagePath: 'assets/images/riders/decade.png', symbolPath: 'assets/images/symbols/decade.png', colorHex: '#FF00FF',
        forms: [
          RiderForm(id: 'decade_normal', name: '通常形态', riderId: 'decade', imagePath: 'assets/images/riders/decade.png'),
          RiderForm(id: 'decade_complete', name: '完全形态', riderId: 'decade', imagePath: 'assets/images/riders/decade_complete.png'),
        ]),
    ]);

  static final w = TVSeries(id: 'w', title: '假面骑士W', yearRange: '2009-2010', era: '平成',
    coverImagePath: 'assets/images/series/w_cover.png', logoPath: 'assets/images/series/w_logo.png',
    themeColorHex: '#00FF00', riders: [
      KamenRider(id: 'w', name: '假面骑士W', seriesId: 'w',
        imagePath: 'assets/images/riders/w.png', symbolPath: 'assets/images/symbols/w.png', colorHex: '#00FF00',
        forms: [
          RiderForm(id: 'w_cj', name: '疾风王牌', riderId: 'w', imagePath: 'assets/images/riders/w_cj.png'),
          RiderForm(id: 'w_hm', name: '炽热金属', riderId: 'w', imagePath: 'assets/images/riders/w_hm.png'),
          RiderForm(id: 'w_lt', name: '月神扳机', riderId: 'w', imagePath: 'assets/images/riders/w_lt.png'),
          RiderForm(id: 'w_xtreme', name: '极限形态', riderId: 'w', imagePath: 'assets/images/riders/w_xtreme.png'),
        ]),
    ]);

  static final ooo = TVSeries(id: 'ooo', title: '假面骑士OOO', yearRange: '2010-2011', era: '平成',
    coverImagePath: 'assets/images/series/ooo_cover.png', logoPath: 'assets/images/series/ooo_logo.png',
    themeColorHex: '#FFD700', riders: [
      KamenRider(id: 'ooo', name: '假面骑士OOO', seriesId: 'ooo',
        imagePath: 'assets/images/riders/ooo.png', symbolPath: 'assets/images/symbols/ooo.png', colorHex: '#00FF00',
        forms: [
          RiderForm(id: 'ooo_tatoba', name: '鹰虎蝗联组', riderId: 'ooo', imagePath: 'assets/images/riders/ooo_tatoba.png'),
          RiderForm(id: 'ooo_gata', name: '锹螳蝗联组', riderId: 'ooo', imagePath: 'assets/images/riders/ooo_gata.png'),
          RiderForm(id: 'ooo_lato', name: '狮虎豹联组', riderId: 'ooo', imagePath: 'assets/images/riders/ooo_lato.png'),
          RiderForm(id: 'ooo_puto', name: '翼角暴联组', riderId: 'ooo', imagePath: 'assets/images/riders/ooo_puto.png'),
        ]),
    ]);

  static final fourze = TVSeries(id: 'fourze', title: '假面骑士Fourze', yearRange: '2011-2012', era: '平成',
    coverImagePath: 'assets/images/series/fourze_cover.png', logoPath: 'assets/images/series/fourze_logo.png',
    themeColorHex: '#FFFFFF', riders: [
      KamenRider(id: 'fourze', name: '假面骑士Fourze', seriesId: 'fourze',
        imagePath: 'assets/images/riders/fourze.png', symbolPath: 'assets/images/symbols/fourze.png', colorHex: '#FFFFFF',
        forms: [
          RiderForm(id: 'fourze_base', name: '基础状态', riderId: 'fourze', imagePath: 'assets/images/riders/fourze_base.png'),
          RiderForm(id: 'fourze_elek', name: '电力状态', riderId: 'fourze', imagePath: 'assets/images/riders/fourze_elek.png'),
          RiderForm(id: 'fourze_fire', name: '火焰状态', riderId: 'fourze', imagePath: 'assets/images/riders/fourze_fire.png'),
          RiderForm(id: 'fourze_cosmic', name: '宇宙状态', riderId: 'fourze', imagePath: 'assets/images/riders/fourze_cosmic.png'),
        ]),
    ]);

  static final wizard = TVSeries(id: 'wizard', title: '假面骑士Wizard', yearRange: '2012-2013', era: '平成',
    coverImagePath: 'assets/images/series/wizard_cover.png', logoPath: 'assets/images/series/wizard_logo.png',
    themeColorHex: '#FF0000', riders: [
      KamenRider(id: 'wizard', name: '假面骑士Wizard', seriesId: 'wizard',
        imagePath: 'assets/images/riders/wizard.png', symbolPath: 'assets/images/symbols/wizard.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'wizard_flame', name: '火焰风格', riderId: 'wizard', imagePath: 'assets/images/riders/wizard_flame.png'),
          RiderForm(id: 'wizard_water', name: '流水风格', riderId: 'wizard', imagePath: 'assets/images/riders/wizard_water.png'),
          RiderForm(id: 'wizard_hurricane', name: '飓风风格', riderId: 'wizard', imagePath: 'assets/images/riders/wizard_hurricane.png'),
          RiderForm(id: 'wizard_land', name: '大地风格', riderId: 'wizard', imagePath: 'assets/images/riders/wizard_land.png'),
        ]),
    ]);

  static final gaim = TVSeries(id: 'gaim', title: '假面骑士铠武', yearRange: '2013-2014', era: '平成',
    coverImagePath: 'assets/images/series/gaim_cover.png', logoPath: 'assets/images/series/gaim_logo.png',
    themeColorHex: '#FF8C00', riders: [
      KamenRider(id: 'gaim', name: '假面骑士铠武', seriesId: 'gaim',
        imagePath: 'assets/images/riders/gaim.png', symbolPath: 'assets/images/symbols/gaim.png', colorHex: '#0000FF',
        forms: [
          RiderForm(id: 'gaim_orange', name: '柳橙武装', riderId: 'gaim', imagePath: 'assets/images/riders/gaim_orange.png'),
          RiderForm(id: 'gaim_kachidoki', name: '胜吼武装', riderId: 'gaim', imagePath: 'assets/images/riders/gaim_kachidoki.png'),
          RiderForm(id: 'gaim_kiwami', name: '极武装', riderId: 'gaim', imagePath: 'assets/images/riders/gaim_kiwami.png'),
        ]),
    ]);

  static final drive = TVSeries(id: 'drive', title: '假面骑士Drive', yearRange: '2014-2015', era: '平成',
    coverImagePath: 'assets/images/series/drive_cover.png', logoPath: 'assets/images/series/drive_logo.png',
    themeColorHex: '#FF0000', riders: [
      KamenRider(id: 'drive', name: '假面骑士Drive', seriesId: 'drive',
        imagePath: 'assets/images/riders/drive.png', symbolPath: 'assets/images/symbols/drive.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'drive_speed', name: '速度型号', riderId: 'drive', imagePath: 'assets/images/riders/drive_speed.png'),
          RiderForm(id: 'drive_wild', name: '狂野型号', riderId: 'drive', imagePath: 'assets/images/riders/drive_wild.png'),
          RiderForm(id: 'drive_technic', name: '技术型号', riderId: 'drive', imagePath: 'assets/images/riders/drive_technic.png'),
        ]),
    ]);

  static final exaid = TVSeries(id: 'exaid', title: '假面骑士Ex-Aid', yearRange: '2016-2017', era: '平成',
    coverImagePath: 'assets/images/series/exaid_cover.png', logoPath: 'assets/images/series/exaid_logo.png',
    themeColorHex: '#FF69B4', riders: [
      KamenRider(id: 'exaid', name: '假面骑士Ex-Aid', seriesId: 'exaid',
        imagePath: 'assets/images/riders/exaid.png', symbolPath: 'assets/images/symbols/exaid.png', colorHex: '#FF69B4',
        forms: [
          RiderForm(id: 'exaid_lv2', name: '动作玩家Lv.2', riderId: 'exaid', imagePath: 'assets/images/riders/exaid_lv2.png'),
          RiderForm(id: 'exaid_lv99', name: '极限玩家Lv.99', riderId: 'exaid', imagePath: 'assets/images/riders/exaid_lv99.png'),
          RiderForm(id: 'exaid_muteki', name: '无敌玩家', riderId: 'exaid', imagePath: 'assets/images/riders/exaid_muteki.png'),
        ]),
    ]);

  static final build = TVSeries(id: 'build', title: '假面骑士Build', yearRange: '2017-2018', era: '平成',
    coverImagePath: 'assets/images/series/build_cover.png', logoPath: 'assets/images/series/build_logo.png',
    themeColorHex: '#FF0000', riders: [
      KamenRider(id: 'build', name: '假面骑士Build', seriesId: 'build',
        imagePath: 'assets/images/riders/build.png', symbolPath: 'assets/images/symbols/build.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'build_rt', name: '兔子坦克', riderId: 'build', imagePath: 'assets/images/riders/build_rt.png'),
          RiderForm(id: 'build_sparkling', name: '气泡形态', riderId: 'build', imagePath: 'assets/images/riders/build_sparkling.png'),
          RiderForm(id: 'build_genius', name: '天才形态', riderId: 'build', imagePath: 'assets/images/riders/build_genius.png'),
        ]),
    ]);

  static final zio = TVSeries(id: 'zio', title: '假面骑士Zi-O', yearRange: '2018-2019', era: '平成',
    coverImagePath: 'assets/images/series/zio_cover.png', logoPath: 'assets/images/series/zio_logo.png',
    themeColorHex: '#FF00FF', riders: [
      KamenRider(id: 'zio', name: '假面骑士Zi-O', seriesId: 'zio',
        imagePath: 'assets/images/riders/zio.png', symbolPath: 'assets/images/symbols/zio.png', colorHex: '#FF00FF',
        forms: [
          RiderForm(id: 'zio_normal', name: '通常形态', riderId: 'zio', imagePath: 'assets/images/riders/zio.png'),
          RiderForm(id: 'zio_ii', name: 'Zi-O II', riderId: 'zio', imagePath: 'assets/images/riders/zio_ii.png'),
          RiderForm(id: 'zio_ohma', name: '逢魔Zi-O', riderId: 'zio', imagePath: 'assets/images/riders/zio_ohma.png'),
        ]),
    ]);

  static final zeroOne = TVSeries(id: 'zero_one', title: '假面骑士Zero-One', yearRange: '2019-2020', era: '令和',
    coverImagePath: 'assets/images/series/zero_one_cover.png', logoPath: 'assets/images/series/zero_one_logo.png',
    themeColorHex: '#FFFF00', riders: [
      KamenRider(id: 'zero_one', name: '假面骑士Zero-One', seriesId: 'zero_one',
        imagePath: 'assets/images/riders/zero_one.png', symbolPath: 'assets/images/symbols/zero_one.png', colorHex: '#FFFF00',
        forms: [
          RiderForm(id: 'zero_one_rising', name: '高跃飞蝗', riderId: 'zero_one', imagePath: 'assets/images/riders/zero_one_rising.png'),
          RiderForm(id: 'zero_one_shining', name: '闪耀飞蝗', riderId: 'zero_one', imagePath: 'assets/images/riders/zero_one_shining.png'),
          RiderForm(id: 'zero_one_two', name: 'Zero-Two', riderId: 'zero_one', imagePath: 'assets/images/riders/zero_one_two.png'),
        ]),
    ]);

  static final saber = TVSeries(id: 'saber', title: '假面骑士Saber', yearRange: '2020-2021', era: '令和',
    coverImagePath: 'assets/images/series/saber_cover.png', logoPath: 'assets/images/series/saber_logo.png',
    themeColorHex: '#FF0000', riders: [
      KamenRider(id: 'saber', name: '假面骑士Saber', seriesId: 'saber',
        imagePath: 'assets/images/riders/saber.png', symbolPath: 'assets/images/symbols/saber.png', colorHex: '#FF0000',
        forms: [
          RiderForm(id: 'saber_brave', name: '勇气飞龙', riderId: 'saber', imagePath: 'assets/images/riders/saber_brave.png'),
          RiderForm(id: 'saber_crimson', name: '龙骑士', riderId: 'saber', imagePath: 'assets/images/riders/saber_crimson.png'),
          RiderForm(id: 'saber_xross', name: 'Xross Saber', riderId: 'saber', imagePath: 'assets/images/riders/saber_xross.png'),
        ]),
    ]);

  static final revice = TVSeries(id: 'revice', title: '假面骑士Revice', yearRange: '2021-2022', era: '令和',
    coverImagePath: 'assets/images/series/revice_cover.png', logoPath: 'assets/images/series/revice_logo.png',
    themeColorHex: '#FF69B4', riders: [
      KamenRider(id: 'revi', name: '假面骑士Revi', seriesId: 'revice',
        imagePath: 'assets/images/riders/revi.png', symbolPath: 'assets/images/symbols/revi.png', colorHex: '#FF69B4',
        forms: [
          RiderForm(id: 'revi_rex', name: '暴龙基因组', riderId: 'revi', imagePath: 'assets/images/riders/revi_rex.png'),
          RiderForm(id: 'revi_barid', name: '破壳暴龙', riderId: 'revi', imagePath: 'assets/images/riders/revi_barid.png'),
        ]),
    ]);

  static final geats = TVSeries(id: 'geats', title: '假面骑士Geats', yearRange: '2022-2023', era: '令和',
    coverImagePath: 'assets/images/series/geats_cover.png', logoPath: 'assets/images/series/geats_logo.png',
    themeColorHex: '#FFFFFF', riders: [
      KamenRider(id: 'geats', name: '假面骑士Geats', seriesId: 'geats',
        imagePath: 'assets/images/riders/geats.png', symbolPath: 'assets/images/symbols/geats.png', colorHex: '#FFFFFF',
        forms: [
          RiderForm(id: 'geats_magnum', name: '马格南推进器', riderId: 'geats', imagePath: 'assets/images/riders/geats_magnum.png'),
          RiderForm(id: 'geats_boost', name: '推进器形态', riderId: 'geats', imagePath: 'assets/images/riders/geats_boost.png'),
          RiderForm(id: 'geats_ix', name: 'Geats IX', riderId: 'geats', imagePath: 'assets/images/riders/geats_ix.png'),
        ]),
    ]);

  static final gotchard = TVSeries(id: 'gotchard', title: '假面骑士Gotchard', yearRange: '2023-2024', era: '令和',
    coverImagePath: 'assets/images/series/gotchard_cover.png', logoPath: 'assets/images/series/gotchard_logo.png',
    themeColorHex: '#00BFFF', riders: [
      KamenRider(id: 'gotchard', name: '假面骑士Gotchard', seriesId: 'gotchard',
        imagePath: 'assets/images/riders/gotchard.png', symbolPath: 'assets/images/symbols/gotchard.png', colorHex: '#00BFFF',
        forms: [
          RiderForm(id: 'gotchard_steamhopper', name: '蒸汽蝗虫', riderId: 'gotchard', imagePath: 'assets/images/riders/gotchard_steamhopper.png'),
          RiderForm(id: 'gotchard_super', name: '超级Gotchard', riderId: 'gotchard', imagePath: 'assets/images/riders/gotchard_super.png'),
        ]),
    ]);

  static final List<TVSeries> _all = [
    kuuga, ryuki, faiz, blade, deno, decade, w, ooo, fourze,
    wizard, gaim, drive, exaid, build, zio,
    zeroOne, saber, revice, geats, gotchard,
  ];

  static List<TVSeries> getAllSeries() => _all;
  static TVSeries? getSeriesById(String id) { try { return _all.firstWhere((s) => s.id == id); } catch (_) { return null; } }
  static List<KamenRider> getRidersBySeries(String id) => getSeriesById(id)?.riders ?? [];
  static KamenRider? getRiderById(String id) { for (final s in _all) { for (final r in s.riders) { if (r.id == id) return r; } } return null; }
  static List<SoundEffect> getSounds(String riderId, String formId) {
    final rider = getRiderById(riderId);
    if (rider == null) return [];
    return _baseSounds(riderId, rider.seriesId, formId: formId);
  }
  static List<dynamic> search(String query) {
    final results = <dynamic>[];
    final kw = query.toLowerCase();
    for (final s in _all) {
      if (s.title.toLowerCase().contains(kw)) results.add(s);
      for (final r in s.riders) { if (r.name.toLowerCase().contains(kw)) results.add(r); }
    }
    return results;
  }
  static List<String> get eras => ['全部', '昭和', '平成', '令和'];
}
