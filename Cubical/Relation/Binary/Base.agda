{-# OPTIONS --cubical --safe #-}
module Cubical.Relation.Binary.Base where

open import Cubical.Core.Everything

open import Cubical.Foundations.HLevels 

open import Cubical.HITs.SetQuotients.Base

module BinaryRelation {ℓ ℓ' : Level} {A : Set ℓ} (R : A → A → Set ℓ') where
  isRefl : Set (ℓ-max ℓ ℓ')
  isRefl = (a : A) → R a a

  isSym : Set (ℓ-max ℓ ℓ')
  isSym = (a b : A) → R a b → R b a

  isTrans : Set (ℓ-max ℓ ℓ')
  isTrans = (a b c : A)  → R a b → R b c → R a c

  record isEquivRel : Set (ℓ-max ℓ ℓ') where
    constructor EquivRel
    field
      reflexive : isRefl
      symmetric : isSym
      transitive : isTrans

  isPropValued : Set (ℓ-max ℓ ℓ')
  isPropValued = (a b : A) → isProp (R a b)

  isEffective : Set (ℓ-max ℓ ℓ')
  isEffective = (a b : A) →
    let x : A / R
        x = [ a ]
        y : A / R
        y = [ b ]
    in (x ≡ y) ≃ R a b
