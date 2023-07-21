import '../../models/plant.dart';
import 'package:get/get.dart';

List<Plant> plantDataList = [
  //tomato
  Plant(
    commonName: 'Tomato'.tr,
    scientificName: 'Solanum lycopersicum'.tr,
    description:
        "1. The tomato plant (Solanum lycopersicum) is a popular and versatile plant cultivated worldwide for its delicious and nutritious fruit.\n\n2. Tomato plants have a sprawling growth habit with vine-like stems that require support. The leaves are compound and typically green with a slightly hairy texture. The flowers are small, yellow, and usually self-pollinating.\n\n3. Tomatoes come in various sizes, shapes, and colors depending on the variety. The fruits develop after successful pollination and can be harvested when they reach maturity.\n\n4. To cultivate tomato plants successfully, it\\'s essential to consider factors such as soil preparation, watering, fertilizing, and pest control. Staking or pruning techniques may also be necessary for optimal growth and fruit production."
            .tr,
    diseases: [
      'Late blight'.tr,
    ],
    diseases_desc: [
      "1. Late blight is a destructive and highly contagious fungal disease that primarily affects tomatoes and potatoes. It is caused by the pathogen Phytophthora infestans.\n\n2. The disease commonly appears as dark, water-soaked lesions on leaves, stems, and fruits of infected plants. These lesions may rapidly enlarge, turn brown, and develop a fuzzy white mold growth on the undersides during humid conditions.\n\n3. Late blight thrives in cool and wet conditions, particularly during periods of high humidity and temperatures ranging from 50 to 80°F (10 to 27°C). Spores of the pathogen can spread rapidly through wind, rain, or movement of infected plant material.\n\n4. It is crucial to promptly identify and manage late blight to prevent severe crop damage. Control measures include removing and destroying infected plants, applying fungicides, maintaining proper spacing between plants, promoting good air circulation, and practicing crop rotation."
          .tr
    ],
    treatements: [
      "1. Promptly remove and destroy any infected plants, including leaves, stems, and fruits. This helps prevent the spread of the disease.\n\n2. Apply appropriate fungicides according to the manufacturer's instructions. Fungicides containing active ingredients like chlorothalonil, mancozeb, or copper can be effective against late blight. Follow the recommended application rates and timings.\n\n3. Ensure proper spacing between plants to promote good air circulation. This reduces humidity levels and creates an environment less favorable for the development and spread of late blight.\n\n4. Practice crop rotation by avoiding planting tomatoes or potatoes in the same location for consecutive years. This helps break the disease cycle as the pathogen cannot survive without a suitable host plant.\n\nRemember to regularly monitor your plants for any signs of late blight and take action promptly if detected. Early intervention is crucial to prevent severe damage and minimize the spread of the disease."
          .tr
    ],
    plantImage: 'assets/images/plants/tomato/tomato.png',
    diseaseImage: [
      'assets/images/plants/tomato/lateBlightTomato.jpg',
    ],
  ),

  //peaches

  Plant(
    commonName: 'Peach'.tr,
    scientificName: 'Prunus persica'.tr,
    description:
        "1. Peaches are juicy and delicious fruits that belong to the Prunus genus.\n\n2. They are native to China and are now cultivated in various parts of the world.\n\n3.Peaches have a soft, fuzzy skin, and their flesh is sweet and aromatic.\n\n4. They come in different varieties, including clingstone and freestone.\n\n5. Peaches are rich in vitamins A and C and are a good source of dietary fiber."
            .tr,
    diseases: [
      'Bacterial spot'.tr,
    ],
    diseases_desc: [
      "1. Bacterial spot is a common and destructive disease that affects peach trees. It is caused by the bacterium Xanthomonas arboricola pv. pruni.\n\n2. The disease typically manifests as small, dark spots on the leaves, fruits, and twigs of infected peach trees. These spots may have a water-soaked appearance and can enlarge over time. As the disease progresses, the spots develop a raised, corky texture and may lead to premature leaf drop and fruit rot.\n\n3. Bacterial spot thrives in warm and humid conditions, especially during periods of rainfall or overhead irrigation. The bacterium can overwinter in infected buds, bark, and cankers, leading to recurring infections in subsequent seasons.\n\n4. Proper identification and management of bacterial spot are crucial to minimize its impact on peach tree health and fruit quality."
          .tr,
    ],
    treatements: [
      "1. Prune and remove infected plant parts, including branches, twigs, and fruit showing symptoms of bacterial spot. Dispose of the pruned material away from the orchard to prevent further spread.\n\n2. Apply copper-based bactericides during the dormant season to protect against bacterial spot infection. Follow the manufacturer's instructions for proper application rates and timings.\n\n3. Implement cultural practices that promote good tree health, such as proper spacing, pruning to improve air circulation, and avoiding excessive nitrogen fertilization. These practices help create an environment less favorable for bacterial spot development.\n\n4. Avoid overhead irrigation, as wetting the foliage increases the risk of bacterial spot infection. Instead, utilize drip irrigation or other methods that minimize moisture on the leaves and fruit.\n\n5. If the disease pressure is high, consider applying protective copper-based sprays during the growing season. These sprays provide additional control against bacterial spot when applied preventatively or at the first signs of the disease.\n\nRemember to consult with local agricultural extension offices or experts for specific recommendations and guidance tailored to your region and orchard management practices."
          .tr,
    ],
    plantImage: 'assets/images/plants/peach/peach.png',
    diseaseImage: [
      'assets/images/plants/peach/bacterialspotPeach.jpg',
    ],
  ),

  //Rose

  Plant(
    commonName: 'Rose'.tr,
    scientificName: 'Rosa'.tr,
    description:
        "1. Roses are popular flowering plants that belong to the Rosa genus.\n\n2. They come in a wide range of colors, sizes, and fragrances.\n\n3. Roses have thorny stems and attractive, layered petals.\n\n4. They are widely cultivated for ornamental purposes and are often used in gardens and floral arrangements.\n\n5. Roses have symbolic meanings and are associated with love, beauty, and romance."
            .tr,
    diseases: [
      'Black spot'.tr,
    ],
    diseases_desc: [
      "1. Rose black spot is a common and widespread fungal disease that affects roses. It is caused by the fungus Diplocarpon rosae.\n\n2. The disease typically appears as black or dark brown spots on the leaves of infected roses. These spots may start small but gradually increase in size, causing the affected leaves to turn yellow and eventually drop prematurely. In severe cases, the black spots can coalesce, leading to defoliation and weakening of the rose plant.\n\n3. Rose black spot thrives in warm and humid conditions, especially when foliage remains wet for prolonged periods. The fungus overwinters on fallen leaves and can spread through splashing water, rain, or wind-dispersed spores.\n\n4. Effective management of rose black spot involves a combination of cultural practices and fungicidal treatments. Early detection and consistent control measures are essential to maintain healthy roses."
          .tr,
    ],
    treatements: [
      "1. Prune and remove any infected leaves, canes, or plant debris from around the rose bushes. Proper sanitation helps reduce the source of inoculum and limits the spread of the disease.\n\n2. Ensure good air circulation around the rose plants by pruning for better spacing and removing any overcrowded branches. This promotes faster drying of the foliage and reduces the favorable conditions for black spot development.\n\n3. Water the roses at the base, avoiding overhead irrigation. Wet foliage can facilitate the spread of the fungus. Mulching around the plants can also help maintain soil moisture and prevent splashing of spores onto the leaves.\n\n4. Apply fungicides specifically labeled for black spot control on roses. Follow the manufacturer's instructions regarding application rates and timings. Begin spraying preventatively, especially during periods of high humidity or when black spot is known to be present.\n\n5. Consider planting resistant rose varieties that are less susceptible to black spot. These varieties can provide a level of natural resistance, reducing the need for frequent fungicidal treatments.\n\nConsult with local rose experts or garden centers for specific fungicide recommendations and guidelines tailored to your region and rose cultivars."
          .tr,
    ],
    plantImage: 'assets/images/plants/rose/rose.png',
    diseaseImage: [
      'assets/images/plants/rose/blackSpotRose.jpg',
    ],
  ),

  //Grape

  Plant(
    commonName: 'Grape'.tr,
    scientificName: 'Vitis'.tr,
    description:
        "1. Grapes are fruits that grow on vines of the Vitis genus.\n\n2. They are native to the Mediterranean region and are now cultivated worldwide.\n\n3. Grapes come in various colors, including green, red, and purple.\n\n4. They are often consumed fresh or used for making wines, juices, and raisins.\n\n5. Grapes are a rich source of antioxidants, vitamins, and minerals."
            .tr,
    diseases: [
      'Black rot'.tr,
    ],
    diseases_desc: [
      "1. Grape black rot is a fungal disease caused by the pathogen Guignardia bidwellii. It affects various grape cultivars and can cause significant damage to both foliage and fruit.\n\n2. The disease manifests as small, dark brown or black circular lesions on grape berries, leaves, and stems. These lesions may enlarge and become sunken, with a characteristic 'mummified' appearance. Infected berries often shrivel and turn black, resulting in severe fruit loss.\n\n3. Grape black rot thrives in warm and humid climates. The fungus overwinters in infected plant material, such as dried berries and canes, and releases spores in spring during rainfall or high humidity.\n\n4. Proper identification, monitoring, and management of grape black rot are essential to protect vineyards and preserve grape yield and quality."
          .tr,
    ],
    treatements: [
      "1. Prune and remove any infected grape clusters, leaves, and canes from the vineyard. Destroy the pruned material to prevent the spread of the disease. Proper sanitation practices help reduce the inoculum source.\n\n2. Implement canopy management techniques that promote good air circulation and sunlight penetration into the grapevine canopy. This reduces humidity levels and creates an environment less favorable for black rot development.\n\n3. Apply appropriate fungicides during critical growth stages to protect against grape black rot. Fungicides containing active ingredients like captan, myclobutanil, or mancozeb are commonly used. Follow the manufacturer's instructions for application rates and timings.\n\n4. Remove weeds and grasses around the base of the grapevines, as they can harbor the black rot fungus. Maintaining weed-free zones reduces the chances of infection and improves air circulation.\n\n5. Practice regular monitoring of grape clusters, leaves, and stems for early signs of black rot. Promptly remove and destroy any infected plant material to prevent further spread.\n\nConsult with local viticulture experts or agricultural extension offices for specific fungicide recommendations and guidelines tailored to your grape cultivars and regional conditions."
          .tr,
    ],
    plantImage: 'assets/images/plants/grape/grape.png',
    diseaseImage: [
      'assets/images/plants/grape/blackRotGrapes.jpg',
    ],
  ),

  //Aloe Vera

  // Plant(
  //     commonName: 'Aloa Vera',
  //     scientificName: 'Prunus persica',
  //     description:
  //         'Peach, Prunus persica, is a deciduous tree or shrub in the family Rosaceae grown for its edible fruit of the same name. The peach tree is relatively short with slender and and supple branches. The leaves are alternately arranged, slender and pointed. The tree produces pink flowers which have five petals and emerge in January and February. The fruit is a velvety, soft, fleshy red to yellow-orange fruit which is oval in shape and 3-8 cm in diameter. Peach trees can grow up to 8 m (19 ft) in height and produce fruit for 10 to 20 years. Peach may also be referred to as nectarine, the two fruits belonging to the same species, although nectarines have smooth skin, and are believed to have originated in China.',
  //     diseases: [
  //       'Bacterial spot',
  //       'Crown gall ',
  //     ],
  //     diseases_desc: [
  //       'Water soaked, angular gray lesions on the underside of the leaves which turn purple and necrotic in the center and cause a shot hole appearance if lesion center drops out; if lesions are present in high numbers on leaves they may become chlorotic and drop from tree; cankers develop on twigs either as raised blisters or as a dark area surrounding a bud that fails to open; in years of severe infection the entire fruit crop may be lost; lesions on fruit begin as small brown, water-soaked lesions which may exude gum',
  //       'Galls on roots and/or crown of tree which can range in size from so small they are not visible to the naked eye up to 10 cm (4 in) in diameter; galls first become visible as white, fleshy swellings that grow rapidly and become tan to brown in color; galls typically develop at the site of a wound and new galls form adjacent to old ones the next year'
  //     ],
  //     treatements: [
  //       'Ensure that a suitable peach variety and rootstock is chosen based on geographic location and environmental conditions to prevent stress to tree which predisposes tree to canker disease; apply protective copper spray to trees before flowering; prune trees in early summer to decrease likelihood of infection',
  //       'Avoid planting susceptible peach varieties in areas where disease is known; once disease is visible it can be difficult to control, protective copper applications in the Fall prior to leaf drop and/or application in early growing season may help prevent the disease; care should be taken as peach trees are very sensitive to copper.',
  //     ]),
];
