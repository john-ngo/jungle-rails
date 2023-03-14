describe("Product", () => {
  beforeEach(() => {
    cy.visit("/");

    cy.contains("Jungle");
  });

  it("can navigate to product page", () => {
    cy.get('.products article [href="/products/2"]').click();
    cy.get(".product-detail h1").should("have.text", "Scented Blade");
    cy.get(".product-detail p")
      .should("contain", "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.");
    cy.get(".product-detail .quantity").should("contain", "$24.99")
  });
});