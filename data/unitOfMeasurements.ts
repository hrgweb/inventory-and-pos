interface IUnit {
  label: string
  abbr: string
  value: string
}

interface IUnitType extends IUnit {}

const basicUnits = [
  {
    label: 'Piece',
    abbr: 'pc',
    value: 'piece'
  }
  // {
  //   label: 'Box',
  //   abbr: 'box',
  //   value: 'box'
  // },
  // {
  //   label: 'Sack',
  //   abbr: 'sack',
  //   value: 'sack'
  // },
  // {
  //   label: 'Packet',
  //   abbr: 'pkt',
  //   value: 'packet'
  // },
  // {
  //   label: 'Dozen',
  //   abbr: 'doz',
  //   value: 'dozen'
  // },
  // {
  //   label: 'Case',
  //   abbr: 'case',
  //   value: 'case'
  // }
] as IUnit[]

const weightBased = [
  {
    label: 'Gram',
    abbr: 'g',
    value: 'gram'
  },
  {
    label: 'Kilogram',
    abbr: 'kg',
    value: 'kilogram'
  }
] as IUnitType[]

const volumeBased = [
  {
    label: 'Millilitre',
    abbr: 'ml',
    value: 'millilitre'
  },
  {
    label: 'Litre',
    abbr: 'l',
    value: 'litre'
  },
  {
    label: 'Gallon',
    abbr: 'gal',
    value: 'gallon'
  }
] as IUnitType[]

const lengthBased = [
  {
    label: 'Inch',
    abbr: 'in',
    value: 'inch'
  },
  {
    label: 'Centimeter',
    abbr: 'cm',
    value: 'centimeter'
  },
  {
    label: 'Metre',
    abbr: 'm',
    value: 'metre'
  }
] as IUnitType[]

const countBased = [
  // {
  //   label: 'Pack',
  //   abbr: 'pk',
  //   value: 'pack'
  // },
  // {
  //   label: 'Roll',
  //   abbr: 'rl',
  //   value: 'roll'
  // }
] as IUnitType[]

export const unitOfMeasurements = [
  ...countBased,
  ...basicUnits,
  ...weightBased,
  ...volumeBased,
  ...lengthBased
]
