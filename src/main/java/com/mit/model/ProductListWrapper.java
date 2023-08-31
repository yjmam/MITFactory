package com.mit.model;

import java.util.List;

import lombok.Data;

@Data
public class ProductListWrapper {
   private List<ProductDTO> productWrapperList;
}