export const chartData = [
  { name: 'January', Total: 1200 },
  { name: 'February', Total: 2100 },
  { name: 'March', Total: 800 },
  { name: 'April', Total: 1600 },
  { name: 'May', Total: 900 },
  { name: 'June', Total: 1700 },
];

export const transactions = [
  {
    transaction_id: 1143155,
    bond_id: '1234455',
    transaction_price: '12345',
    quantity: '25',
    transaction_time: '1 March',
    type: 'buy',
  },
  {
    transaction_id: 2235235,
    bond_id: '3465434',
    transaction_price: '8765434',
    transaction_time: '1 March',
    quantity: 900,
    type: 'buy',
  },
  {
    transaction_id: 2342353,
    bond_id: '9876544',
    transaction_price: '100000',
    transaction_time: '1 March',
    transaction_price: 35,
    quantity: 240,
    type: 'sell',
  },
  {
    transaction_id: 2357741,
    bond_id: '3457998',
    transaction_price: '350000',
    transaction_time: '1 March',
    transaction_price: 920,
    quantity: 50,
    type: 'buy',
  },
  {
    transaction_id: 2342355,
    bond_id: '081244',
    transaction_price: '23000',
    transaction_time: '1 March',
    transaction_price: 2000,
    quantity: 370,
    type: 'sell',
  },
];

// Bonds DAta
export const bondsData = [
  {
    id: 2342355,
    bond: 'Muthoot Fin. Ltd. Series VII',
    issuerName: 'Muthoot Finance Limited',
    rating: 'AA+',
    minInvest: '10000',
    yield: '8.6',
    tenure: '61',
  },
  {
    id: 3465767,
    bond: 'Muthoot Fin. Ltd. Series VI',
    issuerName: 'Muthoot Finance Limited',
    rating: 'AA+',
    minInvest: '10000',
    yield: '8.5',
    tenure: '37',
  },
  {
    id: 1234646,
    bond: 'Indore Municipal Corporation',
    issuerName: 'Indore Municipal Corporation',
    rating: 'AA+',
    minInvest: '10000',
    yield: '8.42',
    tenure: '108',
  },
];

// Orders DAta
export const ordersData = [
  {
    id: 2342355,
    date: '11/02/2023',
    bond: 'Muthoot Finance Limited VII',
    soldTo: 'Prajwal Jaiswal',
    soldBy: 'Muthoot Finance Limited',
    amount: '10000',
  },
  {
    id: 7653456,
    date: '01/02/2023',
    bond: 'Muthoot Finance Limited VI',
    soldTo: 'Prajwal Jaiswal',
    soldBy: 'Muthoot Finance Limited',
    amount: '30000',
  },
];

export const usersData1 = [
  {
    id: '1234235',
    name: 'Jane Doe',
    contact_no: '12345677890',
    email: 'asdf@email.com',
    wallet: 100000,
    kyc_completed: 1,
    profile_photo:
      'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    address_proof: '',
    bank_detail: '',
    pan_card: '',
  },
];
