describe("Cart", () => {
  beforeEach(() => {
    cy.visit("/");

    cy.contains("Jungle");
  });

  it("can add a product to cart", () => {
    cy.contains("My Cart").should("contain", "0");
    cy.get('.products article:nth-child(1) button[type="submit"]').click();
    cy.contains("My Cart").should("contain", "1");
  });
});