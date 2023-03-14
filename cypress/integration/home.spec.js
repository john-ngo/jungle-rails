describe("Home", () => {
  beforeEach(() => {
    cy.visit("/");

    cy.contains("Jungle");
  });

  it("contains a product", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("contains 2 products", () => {
    cy.get(".products article").should("have.length", 2);
  });
});