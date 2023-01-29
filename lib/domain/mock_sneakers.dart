import 'package:flutter/material.dart';
import 'package:sneakers/core/images/images.dart';
import 'package:sneakers/domain/entities/asset.dart';
import 'package:sneakers/domain/entities/brand.dart';
import 'package:sneakers/domain/entities/sneaker.dart';
import 'package:sneakers/domain/entities/sneakers.dart';

const mockSneakers = Sneakers(
  brands: [
    Brand(
      id: 1,
      name: 'Nike',
      featured: [
        Sneaker(
          id: 1,
          shortName: 'Air-Zoom',
          name: 'Air-Zoom-20',
          brandName: 'Nike',
          price: 130,
          type: SneakerType.featured,
          color: Colors.purple,
          assets: [
            Asset(
              type: AssetType.picture,
              path: Images.sneaker1,
            ),
            Asset(
              type: AssetType.picture,
              path: Images.sneaker2,
            ),
            Asset(
              type: AssetType.picture,
              path: Images.sneaker3,
            ),
            Asset(
              type: AssetType.video,
              path: Images.sneaker4,
            ),
          ],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          sizes: [7.5, 8, 9.5, 10, 12],
        ),
        Sneaker(
          id: 2,
          shortName: 'Air-Max',
          name: 'Air-Max-200',
          brandName: 'Nike',
          price: 170,
          type: SneakerType.featured,
          color: Colors.redAccent,
          assets: [
            Asset(
              type: AssetType.picture,
              path: Images.sneaker2,
            ),
            Asset(
              type: AssetType.picture,
              path: Images.sneaker1,
            ),
            Asset(
              type: AssetType.picture,
              path: Images.sneaker3,
            ),
            Asset(
              type: AssetType.video,
              path: Images.sneaker4,
            ),
          ],
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          sizes: [7.5, 8, 9.5, 10, 12],
        ),
        ..._moreMockSneakers,
      ],
      upcoming: [],
      newModels: [],
    ),
    Brand(
      id: 2,
      name: 'Adidas',
    ),
    Brand(
      id: 3,
      name: 'Jordan',
    ),
    Brand(
      id: 4,
      name: 'Puma',
    ),
    Brand(
      id: 5,
      name: 'Reebok',
    ),
  ],
  more: _moreMockSneakers,
);

const _moreMockSneakers = [
  Sneaker(
    id: 3,
    shortName: 'Air-Force',
    name: 'Air-Force-100',
    brandName: 'Nike',
    price: 230,
    type: SneakerType.featured,
    color: Colors.lightBlue,
    assets: [
      Asset(
        type: AssetType.picture,
        path: Images.sneaker3,
      ),
      Asset(
        type: AssetType.picture,
        path: Images.sneaker2,
      ),
      Asset(
        type: AssetType.picture,
        path: Images.sneaker1,
      ),
      Asset(
        type: AssetType.video,
        path: Images.sneaker4,
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    sizes: [7.5, 8, 9.5, 10, 12],
  ),
  Sneaker(
    id: 4,
    shortName: 'Blazers',
    name: 'Blazers-30',
    brandName: 'Nike',
    price: 165,
    type: SneakerType.featured,
    color: Colors.green,
    assets: [
      Asset(
        type: AssetType.picture,
        path: Images.sneaker4,
      ),
      Asset(
        type: AssetType.picture,
        path: Images.sneaker2,
      ),
      Asset(
        type: AssetType.picture,
        path: Images.sneaker3,
      ),
      Asset(
        type: AssetType.video,
        path: Images.sneaker1,
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    sizes: [7.5, 8, 9.5, 10, 12],
  ),
];
