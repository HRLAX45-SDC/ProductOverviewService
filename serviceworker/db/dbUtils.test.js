const dbUtils = require('./dbUtils.js');

describe(' DB Utility getProducts  data forming test suite ', () => {
  test('getProducts response should have product_id key ', async () => {
    expect.assertions(1);
    const end = await dbUtils.getProducts();
    expect(typeof end.rows[0].id).toBe('number');
  });
  test('getProducts response should have name key ', async () => {
    expect.assertions(1);
    const end = await dbUtils.getProducts();
    expect(Object.keys(end.rows[0])).toContain('name');
  });
  test('getProducts response should have slogan key ', async () => {
    expect.assertions(1);
    const end = await dbUtils.getProducts();
    expect(Object.keys(end.rows[0])).toContain('slogan');
  });
  test('getProducts response should have description key ', async () => {
    expect.assertions(1);
    const end = await dbUtils.getProducts();
    expect(Object.keys(end.rows[0])).toContain('description');
  });
});

describe(' DB Utility getProduct module data forming test suite ', () => {
  test('Should return only one object', async () => {
    expect.assertions(1);
    expect(await dbUtils.getProduct(1222)).toBeInstanceOf(Object);
  });

});

describe(' DB Utility getStyles module data forming test suite ', () => {
  test('Should return only one object', async () => {
    expect.assertions(1);
    expect(await dbUtils.getStyles(1222)).toBeInstanceOf(Object);
  });

});
describe(' DB Utility getRelated module data forming test suite ', () => {
  test('Should return only one object', async () => {
    expect.assertions(1);
    expect(await dbUtils.getRelated(1222)).toHaveBeenCalled();
  });

});
