export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          operationName?: string
          query?: string
          variables?: Json
          extensions?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      categories: {
        Row: {
          created_at: string
          description: string | null
          id: string
          name: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: string
          name: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          user_id?: string | null
        }
        Relationships: []
      }
      customers: {
        Row: {
          created_at: string
          first_name: string
          id: string
          last_name: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          first_name: string
          id?: string
          last_name: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          first_name?: string
          id?: string
          last_name?: string
          user_id?: string | null
        }
        Relationships: []
      }
      logs: {
        Row: {
          action: string
          created_at: string
          description: string | null
          id: string
          user_id: string | null
        }
        Insert: {
          action: string
          created_at?: string
          description?: string | null
          id?: string
          user_id?: string | null
        }
        Update: {
          action?: string
          created_at?: string
          description?: string | null
          id?: string
          user_id?: string | null
        }
        Relationships: []
      }
      orders: {
        Row: {
          created_at: string
          id: string
          product_id: string | null
          qty: number | null
          subtotal: number | null
          transaction_no: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          product_id?: string | null
          qty?: number | null
          subtotal?: number | null
          transaction_no: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          product_id?: string | null
          qty?: number | null
          subtotal?: number | null
          transaction_no?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "orders_product_id_fkey"
            columns: ["product_id"]
            isOneToOne: false
            referencedRelation: "products"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "orders_transaction_no_fkey"
            columns: ["transaction_no"]
            isOneToOne: false
            referencedRelation: "transactions"
            referencedColumns: ["transaction_no"]
          },
        ]
      }
      products: {
        Row: {
          barcode: string
          barcode_img: string | null
          category_id: string
          cost_price: number
          created_at: string
          description: string | null
          id: string
          name: string
          reorder_level: number
          selling_price: number
          stock_qty: number
          uom: string | null
          user_id: string | null
          volume: number | null
          weight: number | null
        }
        Insert: {
          barcode: string
          barcode_img?: string | null
          category_id?: string
          cost_price?: number
          created_at?: string
          description?: string | null
          id?: string
          name: string
          reorder_level?: number
          selling_price?: number
          stock_qty?: number
          uom?: string | null
          user_id?: string | null
          volume?: number | null
          weight?: number | null
        }
        Update: {
          barcode?: string
          barcode_img?: string | null
          category_id?: string
          cost_price?: number
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          reorder_level?: number
          selling_price?: number
          stock_qty?: number
          uom?: string | null
          user_id?: string | null
          volume?: number | null
          weight?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "products_category_id_fkey"
            columns: ["category_id"]
            isOneToOne: false
            referencedRelation: "categories"
            referencedColumns: ["id"]
          },
        ]
      }
      reorder_products: {
        Row: {
          comment: string | null
          created_at: string
          id: number
          product_id: string
          qty: number
          user_id: string
        }
        Insert: {
          comment?: string | null
          created_at?: string
          id?: number
          product_id: string
          qty: number
          user_id?: string
        }
        Update: {
          comment?: string | null
          created_at?: string
          id?: number
          product_id?: string
          qty?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "reorder_products_product_id_fkey"
            columns: ["product_id"]
            isOneToOne: false
            referencedRelation: "products"
            referencedColumns: ["id"]
          },
        ]
      }
      sales: {
        Row: {
          amount: number | null
          change: number | null
          created_at: string
          id: string
          total: number | null
          transaction_no: string
          user_id: string | null
        }
        Insert: {
          amount?: number | null
          change?: number | null
          created_at?: string
          id?: string
          total?: number | null
          transaction_no: string
          user_id?: string | null
        }
        Update: {
          amount?: number | null
          change?: number | null
          created_at?: string
          id?: string
          total?: number | null
          transaction_no?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "sales_transaction_no_fkey"
            columns: ["transaction_no"]
            isOneToOne: true
            referencedRelation: "transactions"
            referencedColumns: ["transaction_no"]
          },
        ]
      }
      settings: {
        Row: {
          created_at: string
          id: string
          trial_period_days: number
          trial_period_end: string | null
          trial_period_start: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          trial_period_days: number
          trial_period_end?: string | null
          trial_period_start?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          trial_period_days?: number
          trial_period_end?: string | null
          trial_period_start?: string | null
          user_id?: string | null
        }
        Relationships: []
      }
      suppliers: {
        Row: {
          address: string | null
          contact_no: string | null
          contact_person: string | null
          created_at: string
          id: string
          name: string
          user_id: string | null
        }
        Insert: {
          address?: string | null
          contact_no?: string | null
          contact_person?: string | null
          created_at?: string
          id?: string
          name: string
          user_id?: string | null
        }
        Update: {
          address?: string | null
          contact_no?: string | null
          contact_person?: string | null
          created_at?: string
          id?: string
          name?: string
          user_id?: string | null
        }
        Relationships: []
      }
      transactions: {
        Row: {
          created_at: string
          id: string
          status: string
          transaction_no: string
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: string
          status?: string
          transaction_no?: string
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: string
          status?: string
          transaction_no?: string
          user_id?: string | null
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof PublicSchema["CompositeTypes"]
    | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof PublicSchema["CompositeTypes"]
    ? PublicSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

