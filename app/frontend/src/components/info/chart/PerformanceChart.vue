<script>
import { Line } from 'vue-chartjs'
export default({
  extends: Line,
  props: ['chartDataSet'],
  data: function () {
    return {
      datacollection: {
        labels: [
          '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
          '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
          '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''
        ],
        datasets: [
          {
            label: 'mgr1',
            pointBackgroundColor: 'red',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'red',
            data: [
              82.95140415,
              65.75405254,
              64.03180374,
              63.22636816,
              69.67851049,
              76.63220924,
              108.8442836,
              129.3280693,
              182.8553298,
              244.5711149,
              285.7312013,
              380.8287527,
              439.1706996,
              492.6284296,
              510.6394149,
              463.7023309,
              354.6224779,
              291.2843498,
              217.3680575,
              165.5292516,
              128.984113,
              99.56913259,
              84.07105147,
              67.29993725,
              55.33408623,
              42.97033495,
              35.70477598,
              27.05436071,
              23.56092581,
              24.12468781,
              27.06125796,
              30.94585165,
              41.31422899,
              48.63188403,
              59.19234763,
              75.4009228,
              91.7316727,
              103.7775148,
              110.9326628,
              104.2328843,
              91.97528958,
              90.07799036,
              76.19311646,
              56.99597874,
              43.05067639,
              52.6250267,
              70.13829736,
              78.78932395,
              103.7594646,
              135.8311068,
              139.3464899,
              160.3417817,
              155.6259759,
              128.2579747,
              101.2609634,
              92.32315801,
              75.04654668,
              64.18986141,
              56.59808357,
              49.55998252
            ]
          },
          {
            label: 'mgr2',
            pointBackgroundColor: 'blue',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'blue',
            data: [
              96.99671142,
              99.84967468,
              105.2302115,
              120.3365776,
              140.2339919,
              172.8643242,
              226.9518328,
              277.5042739,
              353.7206073,
              436.9030969,
              492.0209005,
              507.9755998,
              565.6325989,
              510.4943944,
              456.9483693,
              432.0676372,
              366.2691525,
              305.3821592,
              267.4370796,
              221.0574782,
              183.3678452,
              158.6891189,
              200.5535735,
              256.9652126,
              279.9241588,
              266.3141569,
              247.0868363,
              206.8370874,
              169.4334929,
              133.6035553,
              116.3961987,
              119.8869613,
              138.474765,
              171.8615785,
              209.2905099,
              295.6587469,
              318.9658455,
              338.3044211,
              267.6487991,
              235.477986,
              207.7185455,
              159.668883,
              120.8418492,
              91.13104687,
              77.28236182,
              81.33863738,
              81.6562606,
              84.82798787,
              75.15764552,
              65.86303778,
              47.62385715,
              39.82049294,
              35.0438982,
              36.20179684,
              41.70594482,
              49.34525549,
              60.14117855,
              74.3499669,
              96.91204954,
              101.0226998
            ]
          },
          {
            label: 'mgr3',
            pointBackgroundColor: 'green',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'green',
            data: [
              96.14043205,
              79.43933516,
              70.81561513,
              55.62638975,
              50.25897602,
              51.79360035,
              52.27538055,
              66.88710645,
              93.76697712,
              119.1103824,
              156.5901197,
              181.3134959,
              203.1696241,
              205.7842956,
              197.9802521,
              179.7198482,
              172.1633217,
              145.6545249,
              113.6454034,
              89.7411164,
              104.2541152,
              145.6434665,
              180.7999721,
              237.4810751,
              263.0814335,
              401.5108228,
              568.2389877,
              723.5544549,
              758.9168252,
              787.9577913,
              727.7856155,
              634.75102,
              517.6224212,
              419.9173419,
              315.2792761,
              224.7799549,
              176.227671,
              146.6466728,
              142.5460806,
              142.5678251,
              152.4705604,
              191.7352274,
              238.303762,
              275.528862,
              317.5624897,
              339.0835272,
              427.2588612,
              504.0022047,
              552.5799747,
              660.9877173,
              713.3311602,
              736.2024033,
              599.7469739,
              544.8708087,
              426.6170096,
              355.7621241,
              311.7299978,
              253.5322872,
              236.3703355
            ]
          },
          {
            label: 'mgr4',
            pointBackgroundColor: 'yellow',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'yellow',
            data: [
              89.45232943,
              74.21706912,
              61.51032589,
              48.03201975,
              42.3120523,
              47.15134636,
              56.01919271,
              67.21616604,
              94.14170134,
              122.4220486,
              136.4390854,
              146.9112902,
              139.0431414,
              101.6359929,
              83.01933774,
              75.98534074,
              65.62626764,
              52.62779903,
              52.81232159,
              59.75788548,
              56.5657068,
              62.29980242,
              83.95951502,
              104.4526657,
              135.8223742,
              159.8862129,
              207.993406,
              229.8722542,
              277.9235067,
              264.3838339,
              257.4113105,
              222.8211669,
              144.3660698,
              104.7626946,
              130.7359383,
              147.0830453,
              182.6813067,
              214.0861213,
              245.6057732,
              236.1504536,
              218.7151564,
              197.9460097,
              164.81364,
              141.6657372,
              122.5921134,
              113.3480773,
              101.3944635,
              124.7375571,
              162.7925724,
              228.7723188,
              275.7614533,
              381.8213594,
              507.3601125,
              546.2022513,
              654.4604888,
              652.8488859,
              527.1337031,
              476.2849529,
              428.6985842,
              394.4787416
            ]
          },
          {
            label: 'mgr5',
            pointBackgroundColor: 'pink',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'pink',
            data: [
              90.12345032,
              75.45279116,
              64.97374027,
              51.86477831,
              37.88853262,
              43.83497217,
              51.08192991,
              65.57410953,
              72.93438352,
              88.51636093,
              99.41666519,
              132.8028563,
              153.5488329,
              158.8945569,
              151.4906135,
              118.195348,
              91.64319955,
              74.17592902,
              57.89734909,
              48.6614731,
              41.81593238,
              35.98898307,
              36.63773345,
              40.85730289,
              44.88390618,
              47.77342705,
              60.95493116,
              68.07494511,
              85.09776076,
              100.9697995,
              106.1876844,
              124.7834725,
              113.893788,
              97.68968423,
              80.14651475,
              65.4632713,
              49.96778548,
              42.33519062,
              57.88370481,
              63.39996003,
              51.90361563,
              45.10308402,
              33.76335499,
              28.12865483,
              21.19767816,
              20.89591063,
              16.27816817,
              15.35002104,
              14.72744834,
              16.22372849,
              20.67486232,
              23.63966788,
              27.15933035,
              26.69528578,
              27.92941193,
              25.45431063,
              19.5000385,
              16.97578186,
              14.54324626,
              10.95264329
            ]
          },
          {
            label: 'mgr6',
            pointBackgroundColor: 'purple',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'purple',
            data: [
              83.50898898,
              78.10329849,
              71.56969627,
              64.90123468,
              53.49216975,
              52.51853552,
              61.20921873,
              86.76133511,
              109.7278919,
              131.6391822,
              167.8012238,
              172.5694556,
              168.3012237,
              143.7406521,
              105.6618295,
              138.5948003,
              160.1881366,
              215.2901885,
              258.8406027,
              303.8776777,
              405.2283844,
              471.7377686,
              561.9310808,
              501.6152067,
              408.9762417,
              376.6663824,
              282.7275727,
              221.3078556,
              154.148647,
              134.202754,
              172.630872,
              234.9119761,
              321.5435521,
              439.4201133,
              540.1978002,
              679.9812127,
              793.4967087,
              823.0987308,
              803.0896929,
              736.6651835,
              607.3494259,
              479.1304658,
              354.4891451,
              261.0290913,
              226.8847942,
              168.7259523,
              145.8773357,
              116.7626728,
              92.43175403,
              99.22078686,
              116.1095588,
              148.55576,
              184.8537195,
              238.5701365,
              331.1468947,
              418.4469242,
              481.1740377,
              523.4286572,
              483.4582528
            ]
          },
          {
            label: 'mgr7',
            pointBackgroundColor: 'greenyellow ',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'greenyellow ',
            data: [
              94.0150333,
              88.95578248,
              100.5482099,
              118.991004,
              137.9520422,
              169.46273,
              209.9464993,
              331.6413336,
              424.2844865,
              566.5337739,
              653.9733224,
              710.6836342,
              708.4290634,
              683.4332665,
              578.7674545,
              437.7862183,
              332.7550175,
              233.4230424,
              176.3875867,
              126.4426645,
              156.6396157,
              165.8837709,
              158.1479894,
              152.7712678,
              136.7588552,
              117.9874056,
              96.7382862,
              76.30770992,
              68.1988607,
              68.27663001,
              63.67037402,
              72.57566713,
              87.45936001,
              100.1752659,
              141.1773921,
              178.3511292,
              219.4619754,
              256.91025,
              308.5617444,
              367.381069,
              341.6075194,
              350.3276908,
              298.647651,
              246.1835552,
              203.2451085,
              165.4778885,
              133.3305083,
              88.65850498,
              73.81270397,
              58.00141039,
              42.54131755,
              35.42722099,
              31.1084049,
              27.29502077,
              21.68423288,
              18.12893401,
              14.16858007,
              12.22809569,
              11.34490695,
              9.910915601
            ]
          },
          {
            label: 'mgr8',
            pointBackgroundColor: 'lightseagreen',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'lightseagreen',
            data: [
              96.99671142,
              99.84967468,
              105.2302115,
              120.3365776,
              140.2339919,
              172.8643242,
              226.9518328,
              277.5042739,
              353.7206073,
              436.9030969,
              492.0209005,
              507.9755998,
              565.6325989,
              510.4943944,
              456.9483693,
              432.0676372,
              366.2691525,
              305.3821592,
              267.4370796,
              221.0574782,
              183.3678452,
              158.6891189,
              200.5535735,
              256.9652126,
              279.9241588,
              266.3141569,
              247.0868363,
              206.8370874,
              169.4334929,
              133.6035553,
              116.3961987,
              119.8869613,
              138.474765,
              171.8615785,
              209.2905099,
              295.6587469,
              318.9658455,
              338.3044211,
              267.6487991,
              235.477986,
              207.7185455,
              159.668883,
              120.8418492,
              91.13104687,
              77.28236182,
              81.33863738,
              81.6562606,
              84.82798787,
              75.15764552,
              65.86303778,
              47.62385715,
              39.82049294,
              35.0438982,
              36.20179684,
              41.70594482,
              49.34525549,
              60.14117855,
              74.3499669,
              96.91204954,
              101.0226998
            ]
          },
          {
            label: 'mgr8',
            pointBackgroundColor: 'magenta',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'magenta',
            data: [
              126.0589041,
              194.3400434,
              259.6876131,
              309.7394257,
              410.5652949,
              457.1957318,
              407.4307987,
              367.1958485,
              303.9405398,
              317.6350491,
              262.6633562,
              212.6514156,
              159.9332311,
              129.799199,
              158.7062382,
              205.0802993,
              265.8296432,
              317.1159586,
              359.7718549,
              384.5656213,
              373.2288871,
              336.2800883,
              286.0614558,
              230.0699177,
              158.4264913,
              122.0220611,
              115.0963173,
              143.6849332,
              172.2605504,
              222.7507986,
              237.323798,
              286.0607105,
              334.1088335,
              385.452679,
              370.3914731,
              314.289833,
              250.0337802,
              207.1033655,
              164.5502289,
              136.073229,
              117.1660104,
              103.565464,
              82.61613358,
              85.11683323,
              88.53806263,
              105.9784709,
              135.235918,
              177.7311228,
              204.7721883,
              237.532509,
              223.8803008,
              205.6587935,
              172.7079328,
              147.5316154,
              126.3111539,
              112.0074217,
              130.0642673,
              155.7365059,
              223.7502272
            ]
          },
          {
            label: 'mgr9',
            pointBackgroundColor: 'teal',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'teal',
            data: [
              126.7364667,
              170.9178756,
              208.1113145,
              249.9246631,
              283.4500962,
              263.4784711,
              225.7167023,
              191.9557299,
              146.2080499,
              97.13141197,
              83.61862715,
              69.29311313,
              65.37320501,
              53.94368778,
              47.31601602,
              43.06122928,
              37.20601259,
              35.05176545,
              30.99116731,
              35.80531691,
              41.27385271,
              52.78681122,
              64.55460847,
              82.53765663,
              117.3467036,
              139.7355606,
              150.2673043,
              157.1459512,
              180.1729767,
              177.9441984,
              141.5435703,
              117.5018615,
              89.99620422,
              63.32107724,
              67.02382782,
              70.18581007,
              58.09735553,
              48.07225728,
              38.68831234,
              31.34879811,
              26.72646317,
              21.67545317,
              20.87169108,
              18.49288051,
              17.15778348,
              16.57862132,
              16.74583879,
              17.97142576,
              21.29294989,
              25.35117965,
              28.5222264,
              31.12237018,
              35.45999195,
              44.85175102,
              43.18571977,
              49.47549264,
              45.81298916,
              43.79113295,
              35.38283141,
              26.34932978
            ]
          },
          {
            label: 'mgr10',
            pointBackgroundColor: 'tomato',
            fill: false,
            borderWidth: 1,
            pointBorderColor: 'tomato',
            data: [
              110.8994178,
              118.0918703,
              107.81637,
              80.53456037,
              53.26387998,
              51.2792921,
              37.92818678,
              31.08928872,
              26.63185576,
              23.07413506,
              19.6147357,
              16.7497688,
              17.73071921,
              18.70179542,
              19.26331895,
              22.27948807,
              28.2947856,
              33.40924148,
              44.83358213,
              62.44386561,
              73.92817634,
              103.4585779,
              139.787993,
              159.1639052,
              180.2730005,
              186.9964656,
              177.7033027,
              161.1385092,
              118.7127102,
              95.36047279,
              64.61211985,
              46.81905198,
              31.09092176,
              37.68067979,
              41.05480788,
              39.9118793,
              30.2138623,
              21.88176772,
              18.1581803,
              21.58215653,
              26.93936338,
              40.05265952,
              54.71452482,
              67.73923423,
              84.71633234,
              100.0872268,
              129.1267908,
              128.9533537,
              129.49064,
              115.355511,
              97.70489877,
              76.44056862,
              57.62234547,
              44.87968932,
              35.12155719,
              26.87323511,
              22.29751552,
              20.9553986,
              21.37750602,
              20.62144958
            ]
          },
          {
            label: 'IEF Total',
            pointBackgroundColor: 'white',
            fill: true,
            borderWidth: 1,
            pointBorderColor: '#249EBF',
            data: [
              99.68831382,
              105.1489679,
              112.9608882,
              119.2043047,
              133.0565537,
              145.0302345,
              148.1491857,
              166.6134387,
              185.7586038,
              222.2870025,
              240.7854652,
              257.1766666,
              270.3409157,
              262.2802908,
              248.1347894,
              241.6422882,
              235.2088831,
              240.7418203,
              253.8192635,
              276.819512,
              312.1765513,
              340.3259343,
              388.9046316,
              415.2721662,
              427.1007157,
              450.5915159,
              473.8942888,
              487.611651,
              489.2306939,
              503.3885425,
              492.3842247,
              517.9953989,
              535.5045373,
              586.9895006,
              638.6609691,
              693.7085624,
              727.5472242,
              746.6659251,
              778.9568308,
              787.7800186,
              730.4052637,
              719.5105935,
              698.6179428,
              699.1049723,
              742.4905737,
              812.5114842,
              956.7961174,
              1000.764656,
              1031.967594,
              1090.146975,
              1064.598631,
              1085.097155,
              1043.835371,
              999.9917078,
              970.1788918,
              964.5533271,
              899.9881505,
              885.6217723,
              865.1362754,
              821.235193
            ]
          }
        ]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            },
            gridLines: {
              display: true
            }
          }],
          xAxes: [{
            gridLines: {
              display: false
            }
          }]
        },
        legend: {
          display: false
        },
        responsive: true,
        maintainAspectRatio: false,
        elements: {
          line: {
            tension: 0.1
          }
        },
        animation: {
          easing: 'linear'
        }
      }
    }
  },
  mounted () {
    this.renderChart(this.datacollection, this.options)
  }
})
</script>
