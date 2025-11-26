Require Import Arith List.
Require Import Permutation.
Require Import Sorted.
Import ListNotations.


(* Função auxiliar: insere x na posição correta em uma lista ordenada *)
Fixpoint insert (x:nat) (l:list nat) :=
  match l with
  | [] => [x]
  | h::tl => if (x <=? h) 
             then x :: l 
             else h :: (insert x tl)
  end.

(* Função principal: ordena a lista usando inserção *)
Fixpoint insertion_sort (l: list nat) :=
  match l with
  | [] => []
  | h::tl => insert h (insertion_sort tl)
  end.

(* LEMA 1: Preservação da Ordenação *)
(* Se l é ordenada, inserir x mantém l ordenada *)

Lemma insert_sorted: forall x l, Sorted le l -> Sorted le (insert x l).
Proof.
  intros x l H.
  induction H as [| a l' H_sorted IH H_rel].
  
  - (* Caso Base: Lista vazia *)
    simpl. apply Sorted_cons. 
    apply Sorted_nil. 
    apply HdRel_nil.
    
  - (* Passo Indutivo: Lista a::l' *)
    simpl.
    destruct (x <=? a) eqn:Heq.
    
    + 
      apply Sorted_cons.
      * apply Sorted_cons; assumption.
      * apply HdRel_cons. 
        apply Nat.leb_le. assumption.
        
    + 
      apply Sorted_cons.
      * apply IH. 
      * 
        simpl.
        destruct l' as [| b tl'].
        
        -- 
           simpl. apply HdRel_cons.
           apply Nat.lt_le_incl. 
           apply Nat.leb_gt in Heq. assumption.
           
        -- 
           
           simpl. destruct (x <=? b).
           
           ++ 
              apply HdRel_cons.
              apply Nat.lt_le_incl.
              apply Nat.leb_gt in Heq. assumption.
              
           ++ 
              apply HdRel_cons.
              
              inversion H_rel. assumption.
Qed.


(* LEMA 2: Propriedade de Permutação *)
(* Inserir x em l gera uma permutação de x::l *)
Lemma insert_perm: forall x l, Permutation (insert x l) (x :: l).
Proof.
  intros x l.
  induction l as [| a l' IH].
  - (* Caso Base *)
    simpl. apply Permutation_refl.
  - (* Passo Indutivo *)
    simpl.
    destruct (x <=? a).
    + 
      apply Permutation_refl.
    + 
      apply perm_trans with (a :: x :: l').
      * apply perm_skip. assumption. 
      * apply perm_swap. 
Qed.


(* --- 3. TEOREMA PRINCIPAL --- *)

Theorem insertion_sort_correct: forall l, 
  Sorted le (insertion_sort l) /\ Permutation (insertion_sort l) l.
Proof.
  induction l as [| h tl IH].
  
  - (* Caso Base: Lista vazia *)
    simpl. split.
    + apply Sorted_nil.
    + apply Permutation_refl.
    
  - (* Passo Indutivo *)
    simpl.
    destruct IH as [H_sort H_perm]. 
    split.
    
    + (* Parte 1: Provar Sorted *)
      apply insert_sorted. 
      assumption.
      
    + (* Parte 2: Provar Permutation *)
      apply perm_trans with (h :: insertion_sort tl).
      * apply insert_perm. 
      * apply perm_skip. assumption.
Qed.